import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Utils/constants.dart';
import 'package:userapp/Utils/custom_alert_dialog.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../Controller/pre_approve_entry_controller.dart';

class GatekeeperReports extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreApproveEntryController>(
        init: PreApproveEntryController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
                body: Stack(
              children: [
                FutureBuilder(
                    future: controller.viewPreApproveEntryReportsApi(
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
                                                      snapshot.data.data[index]
                                                          .name,
                                                      style: GoogleFonts.ubuntu(
                                                          color: HexColor(
                                                              '#4D4D4D'),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )),
                                                    SizedBox(
                                                      height: 37,
                                                    ),
                                                    Row(
                                                      children: [
                                                        CircleAvatar(
                                                            maxRadius: 10,
                                                            backgroundColor:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    153,
                                                                    0,
                                                                    0.35),
                                                            child: SvgPicture.asset(
                                                                'assets/chaticon.svg')),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          'Description',
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 30),
                                                      child: Text(
                                                        snapshot
                                                            .data
                                                            .data[index]
                                                            .description,
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#4D4D4D'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Row(
                                                      children: [
                                                        CircleAvatar(
                                                            maxRadius: 10,
                                                            backgroundColor:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    153,
                                                                    0,
                                                                    0.35),
                                                            child: SvgPicture.asset(
                                                                'assets/chaticon.svg')),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          'Date',
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        SizedBox(width: 70,),
                                                        CircleAvatar(
                                                            maxRadius: 10,
                                                            backgroundColor:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    153,
                                                                    0,
                                                                    0.35),
                                                            child: SvgPicture.asset(
                                                                'assets/chaticon.svg')),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          'Vehicle No',
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 11,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 30),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            snapshot
                                                                .data
                                                                .data[index]
                                                                .arrivaldate,
                                                            style:
                                                                GoogleFonts.ubuntu(
                                                                    color: HexColor(
                                                                        '#4D4D4D'),
                                                                    fontSize: 12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                          ),
                                                          SizedBox(width: 70,),
                                                          Flexible(
                                                            child: Text(
                                                              'hsahjsahs-987668jsjs8',
                                                                  overflow: TextOverflow.ellipsis,
                                                              style:
                                                                  GoogleFonts.ubuntu(
                                                                      color: HexColor(
                                                                          '#4D4D4D'),
                                                                      fontSize: 12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                            ),
                                                          ),
                                                          
                                                        ],
                                                      ),
                                                    ),
                                                   SizedBox(
                                                      height: 30,
                                                    ),
                                                    Row(
                                                      children: [
                                                        CircleAvatar(
                                                            maxRadius: 10,
                                                            backgroundColor:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    153,
                                                                    0,
                                                                    0.35),
                                                            child: SvgPicture.asset(
                                                                'assets/chaticon.svg')),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          'Time',
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 11,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 30),
                                                      child: Text(
                                                        snapshot
                                                            .data
                                                            .data[index]
                                                            .arrivaltime,
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#4D4D4D'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ),
                                                   SizedBox(
                                                      height: 30,
                                                    ),
                                                    Row(
                                                      children: [
                                                        CircleAvatar(
                                                            maxRadius: 10,
                                                            backgroundColor:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    153,
                                                                    0,
                                                                    0.35),
                                                            child: SvgPicture.asset(
                                                                'assets/chaticon.svg')),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          'Vechile no',
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 11,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 30),
                                                      child: Text(
                                                        snapshot
                                                            .data
                                                            .data[index]
                                                            .vechileno,
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#4D4D4D'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 34,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Center(
                                                        child: Container(
                                                          height: 31,
                                                          width: 96,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color:
                                                                      primaryColor,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            7.0),
                                                                  ),
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.8),
                                                                  spreadRadius:
                                                                      4,
                                                                  blurRadius:
                                                                      10,
                                                                  offset:
                                                                      Offset(
                                                                          0, 3),
                                                                )
                                                              ]),
                                                          child: Center(
                                                            child: Text(
                                                              'OK',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Netflix",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 18,
                                                                letterSpacing:
                                                                    0.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ));

                                      // showDialog(
                                      //     context: context,
                                      //     builder: (ctx) => CustomAlertDialog(
                                      //             title: 'Report Full Detail',
                                      //             Columnc: <Widget>[
                                      //               Text(
                                      //                 'Report Title:',
                                      //                 style: TextStyle(
                                      //                     fontWeight:
                                      //                         FontWeight.bold),
                                      //               ),
                                      //               Text(
                                      //                 snapshot.data.data[index]
                                      //                     .title,
                                      //               ),
                                      //               Text(
                                      //                 'Report Description:',
                                      //                 style: TextStyle(
                                      //                     fontWeight:
                                      //                         FontWeight.bold),
                                      //               ),
                                      //               Text(snapshot
                                      //                   .data
                                      //                   .data[index]
                                      //                   .description),
                                      //               Text(
                                      //                 'Date:',
                                      //                 style: TextStyle(
                                      //                     fontWeight:
                                      //                         FontWeight.bold),
                                      //               ),
                                      //               Text(snapshot
                                      //                   .data.data[index].date),
                                      //               Center(
                                      //                 child: ElevatedButton(
                                      //                   style: ElevatedButton.styleFrom(
                                      //                       primary:
                                      //                           Colors.green,
                                      //                       fixedSize:
                                      //                           Size(100, 40),
                                      //                       shape: RoundedRectangleBorder(
                                      //                           borderRadius:
                                      //                               BorderRadius
                                      //                                   .circular(
                                      //                                       20))),
                                      //                   onPressed: () {
                                      //                     Get.back();
                                      //                   },
                                      //                   child: const Text(
                                      //                     'okay',
                                      //                     style: TextStyle(
                                      //                         color:
                                      //                             Colors.white,
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .bold),
                                      //                     textAlign:
                                      //                         TextAlign.center,
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //             ]));
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  height: 27,
                                                  width: 105,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: HexColor(
                                                            '#E8E8E8')),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      4,
                                                    ),
                                                    color: HexColor('#F6F6F6'),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 14),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.calendar_month,
                                                          size: 15,
                                                          color: HexColor(
                                                              '#A7A7A7'),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data
                                                              .data[index]
                                                              .arrivaldate,
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#A5AAB7'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            
                                            ),
                                          
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, top: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot
                                                        .data.data[index].name,
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
                                                  Text(
                                                    snapshot.data.data[index]
                                                        .vechileno,
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
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.lock_clock_sharp,
                                                    color: HexColor('#A5AAB7'),
                                                    size: 15,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    snapshot.data.data[index]
                                                        .arrivaltime,
                                                    style: GoogleFonts.ubuntu(
                                                        color:
                                                            HexColor('#A5AAB7'),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    width: 153,
                                                  ),
                                                  (snapshot.data.data[index]
                                                              .status ==
                                                          0)
                                                      ? ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              primary: HexColor(
                                                                  '#ED0909'),
                                                              fixedSize:
                                                                  Size(100, 22),
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
                                                                .statusdescription
                                                                .toString()
                                                                .toUpperCase(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#FFFFFF'),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        )
                                                      : ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              primary: HexColor(
                                                                  '#4EC018'),
                                                              fixedSize:
                                                                  Size(90, 22),
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
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              height: 10,
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
                        'Pre Approve Entries',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: primaryColor),
                      ),
                    ],
                  ),
                ),
             
              ],
            )),
          );
        });
  }

  // Future<void> showDeleteDialog(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //         title: const Text('Delete'),
  //         content: const Text('Do you want to delete this Admin?'),
  //         actions: <Widget>[
  //           MyButton(
  //               onPressed: () {

  //               },
  //             name: 'Delete',

  //               color: primaryColor,),
  //           MyButton(
  //             onPressed: () {

  //             },
  //            name: 'cancel',

  //             ),
  //         ],
  //       ));
  // }

}
