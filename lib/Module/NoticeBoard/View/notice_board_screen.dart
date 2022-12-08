import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/constants.dart';
import '../Controller/notice_board_controller.dart';
import '../Model/notice_board_model.dart';

class NoticeBoardScreen extends GetView {
  NoticeBoardController noticeBoardController =
      Get.put(NoticeBoardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoticeBoardController>(
      init: NoticeBoardController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            FutureBuilder<List<NoticeBoardModel>>(
                future: controller.viewNoticeBoardApi(
                    controller.userdata.subadminid!,
                    controller.userdata.bearerToken!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.only(left: 16, top: 128),
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
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
                                                snapshot
                                                    .data![index].noticetitle!,
                                                style: GoogleFonts.ubuntu(
                                                    color: HexColor('#4D4D4D'),
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
                                                          Color.fromRGBO(255,
                                                              153, 0, 0.35),
                                                      child: SvgPicture.asset(
                                                          'assets/chaticon.svg')),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'Description',
                                                    style: GoogleFonts.ubuntu(
                                                        color:
                                                            HexColor('#4D4D4D'),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 30),
                                                child: Text(
                                                  snapshot.data![index]
                                                      .noticedetail!,
                                                  style: GoogleFonts.ubuntu(
                                                      color:
                                                          HexColor('#4D4D4D'),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
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
                                                          Color.fromRGBO(255,
                                                              153, 0, 0.35),
                                                      child: SvgPicture.asset(
                                                          'assets/chaticon.svg')),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'Date',
                                                    style: GoogleFonts.ubuntu(
                                                        color:
                                                            HexColor('#4D4D4D'),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 11,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 30),
                                                child: Text(
                                                  snapshot.data![index]
                                                          .startdate! +
                                                      "  ----  " +
                                                      snapshot.data![index]
                                                          .enddate!,
                                                  style: GoogleFonts.ubuntu(
                                                      color:
                                                          HexColor('#4D4D4D'),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
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
                                                          Color.fromRGBO(255,
                                                              153, 0, 0.35),
                                                      child: SvgPicture.asset(
                                                          'assets/chaticon.svg')),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'Time',
                                                    style: GoogleFonts.ubuntu(
                                                        color:
                                                            HexColor('#4D4D4D'),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 11,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 30),
                                                child: Text(
                                                  snapshot.data![index]
                                                          .starttime! +
                                                      "  ----  " +
                                                      snapshot.data![index]
                                                          .endtime!,
                                                  style: GoogleFonts.ubuntu(
                                                      color:
                                                          HexColor('#4D4D4D'),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 37,
                                              ),
                                              GestureDetector(
                                                onTap: () {
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
                                                          fontFamily: "Netflix",
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
                              child: SizedBox(
                                width: 343,
                                height: 72,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Image.asset(
                                            'assets/cardbackground.jpeg',
                                            width: 343,
                                          )),

                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                            height: 24,
                                            width: 97,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: HexColor('#E8E8E8')),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                4,
                                              ),
                                              color: primaryColor,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 8),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.calendar_month,
                                                    size: 12,
                                                    color: HexColor('#FFFFFF'),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    snapshot.data![index]
                                                        .startdate!,
                                                    style: GoogleFonts.ubuntu(
                                                        color:
                                                            HexColor('#FFFFFF'),
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 15, top: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot
                                                  .data![index].noticetitle!,
                                              style: GoogleFonts.ubuntu(
                                                  color: HexColor('#606470'),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              snapshot
                                                  .data![index].noticedetail!,
                                              style: GoogleFonts.ubuntu(
                                                  color: HexColor('#A5AAB7'),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Container(
                                      //   width: Get.width,
                                      //   height: Get.height,

                                      //   decoration: BoxDecoration(
                                      //     borderRadius:
                                      //           BorderRadius.circular(17),
                                      //       boxShadow: [
                                      //         BoxShadow(
                                      //           color: Color.fromARGB(
                                      //               189, 224, 224, 223),
                                      //           spreadRadius: 5,

                                      //           blurRadius: 9,
                                      //           offset: Offset(0,
                                      //               3), // changes position of shadow
                                      //         ),
                                      //       ],
                                      //       color: HexColor('#FFFFFF'),
                                      //     image: DecorationImage(image: AssetImage('assets/cardbackground.jpeg'),
                                      //      fit: BoxFit.cover,)
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data!.length),
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
                    'Notice Board',
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
      ),
    );
  }
}
