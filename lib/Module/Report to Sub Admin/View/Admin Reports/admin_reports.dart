import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
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
    return GetBuilder<AdminReportsController>(
      init: AdminReportsController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              FutureBuilder(
                  future: controller.adminReportsApi(
                      controller.userdata.userid!,
                      controller.userdata.bearerToken!),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: EdgeInsets.only(left: 16, top: 128),
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Container(
                                height: 170,
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                      child: Text(
                                                    'Complaint',
                                                    style: GoogleFonts.ubuntu(
                                                        color:
                                                            HexColor('#4D4D4D'),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    snapshot
                                                        .data.data[index].title,
                                                    style: GoogleFonts.ubuntu(
                                                        color:
                                                            HexColor('#4D4D4D'),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    snapshot.data.data[index]
                                                        .description,
                                                    style: GoogleFonts.ubuntu(
                                                        color:
                                                            HexColor('#4D4D4D'),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  SizedBox(
                                                    height: 17,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.calendar_month,
                                                        color:
                                                            HexColor('#A7A7A7'),
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 14,
                                                      ),
                                                      Text(
                                                        snapshot.data
                                                            .data[index].date,
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#4D4D4D'),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 45,
                                                  ),
                                                  GestureDetector(
                                                    onTap: (){

                                                      Get.back();
                                                    },
                                                    child: Center(
                                                      child: Container(
                                                        height: 31,
                                                        width: 96,
                                                        decoration: BoxDecoration(
                                                          color: primaryColor,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(7.0),
                                                            ),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors.grey
                                                                    .withOpacity(
                                                                        0.8),
                                                                spreadRadius: 4,
                                                                blurRadius: 10,
                                                                offset:
                                                                    Offset(0, 3),
                                                              )
                                                            ]),
                                                        child: Center(
                                                          child: Text(
                                                            'OK',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Netflix",
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              fontSize: 18,
                                                              letterSpacing: 0.0,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ));

                                 
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 283),
                                            child: Container(
                                              height: 27,
                                              width: 90,
                                              child: SvgPicture.asset(
                                                  'assets/cardbg.svg',
                                                  fit: BoxFit.fill),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 15,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot
                                                      .data.data[index].title,
                                                  style: GoogleFonts.ubuntu(
                                                      color:
                                                          HexColor('#A5AAB7'),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        snapshot.data.data[index]
                                                            .description,
                                                            overflow: TextOverflow.ellipsis,
                                                            
                                                        style: GoogleFonts.ubuntu(
                                                          color:
                                                              HexColor('#606470'),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 190,
                                                    ),
                                                    (snapshot.data.data[index]
                                                                .status ==
                                                            0)
                                                        ? Container()
                                                        : ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                primary: HexColor(
                                                                    '#4EC018'),
                                                                fixedSize: Size(
                                                                    80, 22),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10))),
                                                            onPressed: () {},
                                                            child: Text(
                                                              'Inprogress',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: GoogleFonts.ubuntu(
                                                                  color: HexColor(
                                                                      '#FFFFFF'),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),

                                          (snapshot.data.data[index].status ==
                                                  0)
                                              ? SizedBox(
                                                  height: 30,
                                                )
                                              : SizedBox(
                                                  height: 10,
                                                ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_month_sharp,
                                                  color: HexColor('#A5AAB7'),
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  snapshot
                                                      .data.data[index].date,
                                                  style: GoogleFonts.ubuntu(
                                                      color:
                                                          HexColor('#A5AAB7'),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                (snapshot.data.data[index]
                                                            .status ==
                                                        0)
                                                    ? Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 163,
                                                        ),
                                                        child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              primary: HexColor(
                                                                  '#ED0909'),
                                                              fixedSize:
                                                                  Size(80, 22),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10))),
                                                          onPressed: () {},
                                                          child: Text(
                                                            snapshot
                                                                .data
                                                                .data[index]
                                                                .statusdescription,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#FFFFFF'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      )
                                                    : Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 163,
                                                        ),
                                                        child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              primary: HexColor(
                                                                  '#1E2772'),
                                                              fixedSize:
                                                                  Size(80, 22),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10))),
                                                          onPressed: () {
                                                            showProblemDialog(
                                                                context,
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .id,
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .userid,
                                                                controller
                                                                    .userdata
                                                                    .bearerToken!);
                                                          },
                                                          child: Text(
                                                            'Problem Solved',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#FFFFFF'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      )
                                              ],
                                            ),
                                          ),

                                          // Text(snapshot
                                          //     .data.data[index].statusdescription
                                          //     .toString()),

                                          // (snapshot.data.data[index].status == 0)
                                          //     ? Container()
                                          //     : Center(
                                          //         child: ElevatedButton(
                                          //           style: ElevatedButton.styleFrom(
                                          //               primary: Colors.green,
                                          //               fixedSize: Size(100, 30),
                                          //               shape:
                                          //                   RoundedRectangleBorder(
                                          //                       borderRadius:
                                          //                           BorderRadius
                                          //                               .circular(
                                          //                                   20))),
                                          //           onPressed: () {
                                          //             showProblemDialog(
                                          //                 context,
                                          //                 snapshot
                                          //                     .data.data[index].id,
                                          //                 snapshot.data.data[index]
                                          //                     .userid,
                                          //                 controller.userdata
                                          //                     .bearerToken!);
                                          //           },
                                          //           child: const Text(
                                          //             'Problem Solved',
                                          //             style: TextStyle(

                                          //                 color: Colors.white,
                                          //                 fontWeight:
                                          //                     FontWeight.bold),
                                          //             textAlign: TextAlign.center,
                                          //           ),
                                          //         ),
                                          //       )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: snapshot.data.data.length),
                      );
                    } else if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              Padding(
                padding: EdgeInsets.only(left: 38, top: 74),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: HexColor(' #FF9900'),
                            image: DecorationImage(
                                image: AssetImage('assets/back.png'))),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.030,
                    ),
                    Text(
                      'Complaint',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: HexColor('#4D4D4D')),
                    ),
                  ],
                ),
              ),
            ],
          ),
     
          
              floatingActionButton: IconButton(
              padding: EdgeInsets.only(top: 85),
              iconSize: MediaQuery.of(context).size.height * 0.065,
              icon: SvgPicture.asset('assets/addbutton.svg'),
              onPressed: () {
                Get.offAndToNamed(reporttoadmin,
                    arguments: _adminReportsController.userdata);
              }),
        ),
      ),
    );
  }

  Future<void> showProblemDialog(
      BuildContext context, int reportid, int userid, String token) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Center(
                child: Column(
                  children: [
                    SvgPicture.asset('assets/dialogicon.svg'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Complaint'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your Problem has been solved?',
                      style: GoogleFonts.ubuntu(
                          color: HexColor('#4D4D4D'),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                          onPressed: () {
                            _adminReportsController.ProblemSolvedButtonApi(
                                reportid, userid, token);

                            Get.back();
                          },
                          horizontalPadding: 0,
                          verticalPadding: 0,
                          child: Text('Yes'),
                          backgroundColor: HexColor('#5AE244'),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        MyButton(
                          onPressed: () {
                            Get.back();
                          },
                          horizontalPadding: 0,
                          verticalPadding: 0,
                          child: Text('No'),
                          backgroundColor: HexColor('#FF3232'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
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
