import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Module/ReportsHistory/Model/admin_reports_model.dart';

import 'package:userapp/Utils/constants.dart';
import 'package:userapp/Utils/custom_alert_dialog.dart';

import '../Controller/admin_reports_history_controller.dart';


class ReportsHistoryScreen extends GetView {

  final AdmoinReportsHistotryController adminReportsController = Get.put(AdmoinReportsHistotryController());

   @override
  Widget build(BuildContext context) {
    return GetBuilder<AdmoinReportsHistotryController>(
      init: AdmoinReportsHistotryController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
              'Reports History'),
          backgroundColor: primaryColor,
          actions: [],
        ),
        body: FutureBuilder<List<AdminReportHistory>>(
            future: controller.ViewAdminReportsHistoryApi(
                controller.user.subadminid!,
                controller.user.userid!,
                controller.user.bearerToken!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null && snapshot.data!.length != 0) {
                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  contentPadding: EdgeInsets.only(top: 10.0),
                                  title: Text("Report Full Detail"),
                                  content: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Report Title:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data![index].title!,
                                              style: TextStyle(),
                                            ),
                                            Text(
                                              'Report Description: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot
                                                  .data![index].description!,
                                              textAlign: TextAlign.start,
                                            ),
                                            // Text(
                                            //   'UserName:',
                                            //   style: TextStyle(
                                            //       fontWeight: FontWeight.bold),
                                            // ),
                                            // Text(
                                            //   controller.residentName,
                                            // ),
                                            // Text(
                                            //   'View Users Address:',
                                            //   style: TextStyle(
                                            //       fontWeight: FontWeight.bold),
                                            // ),
                                            // Text(
                                            //   controller.residentAddress,
                                            // ),
                                            // Text(
                                            //   'Phone No:',
                                            //   style: TextStyle(
                                            //       fontWeight: FontWeight.bold),
                                            // ),
                                            // Text(
                                            //   controller.residentMobileno,
                                            // ),
                                            Text(
                                              'created_at:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data![index].created_at!
                                                  .split('T')[0],
                                            ),
                                            Text(
                                              'updated_at:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data![index].updated_at!
                                                  .split('T')[0],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  'Status',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                (snapshot.data![index].status ==
                                                        3)
                                                    ? Container(
                                                        width: 400,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  primaryColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(children: [
                                                                Text(
                                                                  'Progress: ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  'Report Rejected',
                                                                ),
                                                              ]),
                                                              Text(
                                                                'Reason: ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .statusdescription!,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        width: 400,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  primaryColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: Column(
                                                            children: [
                                                              Row(children: [
                                                                Text(
                                                                  'Progress: ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .statusdescription!,
                                                                ),
                                                              ]),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: new Container(
                                                  padding:
                                                      new EdgeInsets.all(16.0),
                                                  decoration: new BoxDecoration(
                                                      color: const Color(
                                                          0xFF33b17c),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: new Text(
                                                    'Report Okay',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0,
                                                      fontFamily:
                                                          'helvetica_neue_light',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            },
                            child: Container(
                              height: 130,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: ListTile(
                                  title: Text(
                                      snapshot.data![index].title.toString()),
                                  subtitle: Text(snapshot
                                      .data![index].description
                                      .toString()),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data!.length,
                      ),
                    ),
                  );
                } else {
                  return Text('no resident');
                }
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }

}
