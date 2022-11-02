import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          return Scaffold(
            appBar: AppBar(
              title: Text('Events'),
              backgroundColor: primaryColor,
            ),
            body: FutureBuilder<Event>(
                future: controller.viewEventsApi(
                    userid: controller.userdata.subadminid!,
                    token: controller.userdata.bearerToken!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32.0))),
                                    contentPadding: EdgeInsets.only(top: 10.0),
                                    title: Text("Event Full Detail"),
                                    content: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'Event Title: ${snapshot.data!.data![index].title}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                ' Event Description: ${snapshot.data!.data![index].description}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                'Start Date: ${snapshot.data!.data![index].startdate}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'End Date: ${snapshot.data!.data![index].enddate}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              GestureDetector(
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
                                                    ' Okay',
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
                                            ],
                                          ),
                                        )),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    spreadRadius: 0.1,
                                    blurRadius: 4.0,
                                  ),
                                ], borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.data![index].title
                                            .toString()
                                            .toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(snapshot.data!.data![index].startdate
                                          .toString()),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(snapshot.data!.data![index].enddate
                                          .toString()),
                                      Row(
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                //Get.toNamed(vieweventimages);
                                              },
                                              child: Text('View Images')),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data!.data!.length);
                  } else if (snapshot.hasError) {
                    return Icon(Icons.error_outline);
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          );
        });
  }
}
