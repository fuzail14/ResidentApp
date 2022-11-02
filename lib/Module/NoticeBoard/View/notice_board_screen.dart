import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text('Notice Board'),
         
            backgroundColor: primaryColor,
         
          ),
          body: FutureBuilder<List<NoticeBoardModel>>(
              future: controller.viewNoticeBoardApi(
                  controller.userdata.subadminid!, controller.userdata.bearerToken!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null && snapshot.data!.length != 0) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              height: 130,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(32.0))),
                                        contentPadding:
                                            EdgeInsets.only(top: 10.0),
                                        title: Text("Notice Full Detail"),
                                        content: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    'Notice Title: ${snapshot.data![index].noticetitle}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Notice Description: ${snapshot.data![index].noticedetail}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    'Start Date: ${snapshot.data![index].startdate}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'End Date: ${snapshot.data![index].enddate}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Start Time:${snapshot.data![index].starttime}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    'End Time: ${snapshot.data![index].endtime}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: new Container(
                                                      padding:
                                                          new EdgeInsets.all(
                                                              16.0),
                                                      decoration:
                                                          new BoxDecoration(
                                                              color: const Color(
                                                                  0xFF33b17c),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      child: new Text(
                                                        ' Okay',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18.0,
                                                          fontFamily:
                                                              'helvetica_neue_light',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    title: Text(
                                        snapshot.data![index].noticetitle!),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            snapshot.data![index].noticetitle!),
                                        Text(snapshot
                                            .data![index].noticedetail!),
                                      ],
                                    ),
                               
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
                    return Text('No Notices');
                  }
                } else if (snapshot.hasError) {
                  return Icon(Icons.error_outline);
                } else {
                  return CircularProgressIndicator();
                }
              })),
    );
  }
}
