
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Utils/constants.dart';


class NotificationsScreen extends StatefulWidget {
  @override
  State<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  TextEditingController rejectcontroller = TextEditingController();
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Notifications'),
        automaticallyImplyLeading: false,
        backgroundColor: overallcolor,
      ),
      body: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              title: Text("Report Detail"),
              content: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Report Title: Water Problem',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' Report Description: A problem statement is a concise description of an issue to be addressed or a condition to be improved upon. It identifies the gap between the current (problem) state and desired (goal) state of a process or product. Focusing on the facts, the problem statement should be designed to address the Five Ws. ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Date:$currentdate',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: new Container(
                            padding: new EdgeInsets.all(16.0),
                            decoration: new BoxDecoration(
                                color: const Color(0xFF33b17c),
                                borderRadius: BorderRadius.circular(20)),
                            child: new Text(
                              ' Okay',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontFamily: 'helvetica_neue_light',
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 170,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: ListTile(
                        title: Text('Report Title'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date: ${currentdate}'),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      fixedSize: Size(100, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  onPressed: () {
                                    Get.offAllNamed(homescreen);
                                  },
                                  child: const Text(
                                    'Accept',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      fixedSize: Size(100, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('TextField in Dialog'),
                                            content: Container(
                                              height: 300,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 200,
                                                    width: 300,
                                                    child: Form(
                                                      key: formKey,
                                                      child: TextFormField(
                                                        validator: (val) {
                                                          if (val!.isEmpty) {
                                                            return 'ENTER REASON';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'Reason',
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          40,
                                                                      horizontal:
                                                                          20),
                                                          border:
                                                              OutlineInputBorder(),
                                                        ),
                                                        onChanged: (value) {},
                                                        controller:
                                                            rejectcontroller,
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      if (formKey.currentState!
                                                          .validate()) {
                                                        formKey.currentState!
                                                            .save();
                                                         Get.offAllNamed(
                                                             homescreen);
                                                      } else {
                                                        return null;
                                                      }
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
                                            ),
                                          );
                                        });
                                  },
                                  child:  Text(
                                    'Reject',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                       
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 5),
          ),
        ),
      ),
    );
  }
}
