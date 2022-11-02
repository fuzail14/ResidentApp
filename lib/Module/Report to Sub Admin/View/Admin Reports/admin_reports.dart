import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/Module/Report%20to%20Sub%20Admin/Controller/Admin%20Reports%20Controller/admin_reports_controller.dart';
import 'package:userapp/Module/Report%20to%20Sub%20Admin/Model/Reports.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Utils/constants.dart';
import '../../../../Constants/constants.dart';
import '../../../../Utils/custom_alert_dialog.dart';
import '../../../../Widgets/My Button/my_button.dart';



class AdminReports extends GetView {
  final AdminReportsController _adminReportsController =
      Get.put(AdminReportsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Admin Reports'),
          backgroundColor: overallcolor,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Get.offAndToNamed(reporttoadmin,
                        arguments: _adminReportsController.userdata);
                  },
                  child: Icon(
                    Icons.add,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: GetBuilder<AdminReportsController>(
            init: AdminReportsController(),
            builder: (controller) {
              return FutureBuilder(
                  future: controller.adminReportsApi(
                      controller.userdata.userid!,
                      controller.userdata.bearerToken!),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              height: 175,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => CustomAlertDialog(
                                              title: 'Report Full Detail',
                                              Columnc: <Widget>[
                                                Text(
                                                  'Report Title:',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  snapshot
                                                      .data.data[index].title,
                                                ),
                                                Text(
                                                  'Report Description:',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(snapshot.data.data[index]
                                                    .description),
                                                Text(
                                                  'Date:',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(snapshot
                                                    .data.data[index].date),
                                                Center(
                                                  child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        primary: Colors.green,
                                                        fixedSize:
                                                            Size(100, 40),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20))),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: const Text(
                                                      'okay',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ]));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data.data[index].title),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(snapshot
                                            .data.data[index].date),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Report Status:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(snapshot
                                            .data.data[index].statusdescription
                                            .toString()),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        (snapshot.data.data[index].status == 0)
                                            ? Container()
                                            : Center(
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Colors.green,
                                                      fixedSize: Size(100, 30),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                  onPressed: () {
                                                    showProblemDialog(
                                                        context,
                                                        snapshot.data
                                                            .data[index].id,
                                                        snapshot.data
                                                            .data[index].userid,
                                                        controller.userdata
                                                            .bearerToken!);
                                                  },
                                                  child: const Text(
                                                    'Problem Solved',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                    // trailing: Wrap(children: [
                                    //   InkWell(
                                    //     onTap: () {
                                    //       showDeleteDialog(context);

                                    //     },
                                    //     child: Icon(
                                    //       Icons.delete,
                                    //       color: overallcolor,
                                    //     ),
                                    //   ),
                                    //   SizedBox(
                                    //     width: 20,
                                    //   ),
                                    // ]),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data.data.length);
                    } else if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } else {
                      return CircularProgressIndicator();
                    }
                  });
            }));
  }

  Future<void> showProblemDialog(
      BuildContext context, int reportid, int userid, String token) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Info'),
              content: const Text('Are You Sure Your  Problem Resolved...'),
              actions: <Widget>[
                MyButton(
                  onPressed: () {
                    _adminReportsController.ProblemSolvedButtonApi(
                        reportid, userid, token);

                    Get.back();
                  },
                  horizontalPadding: 0,
                  verticalPadding: 0,
                  child: Text('Yes'),
                  backgroundColor: primaryColor,
                ),
                MyButton(
                  onPressed: () {
                    Get.back();
                  },
                  horizontalPadding: 0,
                  verticalPadding: 0,
                  child: Text('No'),
                ),
              ],
            ));
  }

  Future<void> showDeleteDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Delete'),
              content: const Text('Do you want to delete this Admin?'),
              actions: <Widget>[
                MyButton(
                  onPressed: () {},
                  horizontalPadding: 0,
                  verticalPadding: 0,
                  child: Text('Delete'),
                ),
                MyButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  horizontalPadding: 0,
                  verticalPadding: 0,
                  child: Text('Cancel'),
                ),
              ],
            ));
  }
}
