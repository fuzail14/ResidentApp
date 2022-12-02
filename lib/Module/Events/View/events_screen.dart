import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/constants.dart';
import '../Controller/event_screen_controller.dart';
import '../Model/Event.dart';

class EventsScreen extends GetView {
  final _eventsScreenController = Get.put(EventScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventScreenController>(
        init: EventScreenController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  FutureBuilder<Event>(
                      future: controller.viewEventsApi(
                          userid: controller.userdata.subadminid!,
                          token: controller.userdata.bearerToken!),
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
                                          builder:
                                              (BuildContext context) =>
                                                  AlertDialog(
                                                    title: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Center(
                                                            child: Text(
                                                          snapshot
                                                              .data!
                                                              .data![index]
                                                              .title!,
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
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
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'assets/chaticon.svg')),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              'Description',
                                                              style: GoogleFonts.ubuntu(
                                                                  color: HexColor(
                                                                      '#4D4D4D'),
                                                                  fontSize:
                                                                      14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 30),
                                                          child: Text(
                                                            snapshot
                                                                .data!
                                                                .data![index]
                                                                .description!,
                                                            style: GoogleFonts.ubuntu(
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
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'assets/chaticon.svg')),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              'Date',
                                                              style: GoogleFonts.ubuntu(
                                                                  color: HexColor(
                                                                      '#4D4D4D'),
                                                                  fontSize:
                                                                      14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 27,
                                                                  top: 20),
                                                          child: Container(
                                                              height: 27,
                                                              width: 90,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: HexColor(
                                                                        '#E8E8E8')),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  4,
                                                                ),
                                                                color:
                                                                    primaryColor,
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            8),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .calendar_month,
                                                                      size:
                                                                          12,
                                                                      color: HexColor(
                                                                          '#FFFFFF'),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      snapshot
                                                                          .data!
                                                                          .data![index]
                                                                          .startdate!,
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#FFFFFF'),
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.w300),
                                                                    )
                                                                  ],
                                                                ),
                                                              )),
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color:
                                                                          primaryColor,
                                                                      borderRadius:
                                                                          const BorderRadius.all(
                                                                        Radius.circular(
                                                                            7.0),
                                                                      ),
                                                                      boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(0.8),
                                                                      spreadRadius:
                                                                          4,
                                                                      blurRadius:
                                                                          10,
                                                                      offset: Offset(
                                                                          0,
                                                                          3),
                                                                    )
                                                                  ]),
                                                              child: Center(
                                                                child: Text(
                                                                  'OK',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Netflix",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        18,
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
                                    },
                                    child: SizedBox(
                                      height: 84,
                                      width: 343,
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/eventpic.png',
                                                ),
                                                fit: BoxFit.fitHeight,
                                                alignment:
                                                    Alignment.topRight
                                                    
                                                    
                                                    ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          //decoration:BoxDecoration(
                                          //color: primaryColor,
                                    
                                          //image: DecorationImage(image: AssetImage('assets/eventpic.png'))),
                                    
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 13,top: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text(
                                                      snapshot
                                                          .data!
                                                          .data![index]
                                                          .title!,
                                                      style:
                                                          GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#606470'),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    SizedBox(
                                                      height: 6,
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data!
                                                          .data![index]
                                                          .startdate!,
                                                      style:
                                                          GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#A5AAB7'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(left: 15,top: 5),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                  height: 18,
                                                  width: 93,
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
                                                      left: 4),
                                                    child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.calendar_month,
                                                        size: 15,
                                                        color: HexColor(
                                                            '#A7A7A7'),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data!
                                                            .data![index]
                                                            .startdate!,
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
                                                   SizedBox(width: 12,),
                                                    Container(
                                                        height: 18,
                                                        width: 63,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: HexColor(
                                                                  '#E8E8E8')),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            4,
                                                          ),
                                                          color: primaryColor,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'View Image',
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#FFFFFF'),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: snapshot.data!.data!.length),
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
                          'Society Events',
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
              ),
            ),
          );
        });
  }
}
