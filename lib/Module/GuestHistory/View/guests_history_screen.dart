import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:userapp/Utils/constants.dart';
import 'package:userapp/Utils/custom_alert_dialog.dart';

class GuestsHistoryScreen extends StatefulWidget {
  @override
  State<GuestsHistoryScreen> createState() => _GuestsHistoryScreenState();
}

class _GuestsHistoryScreenState extends State<GuestsHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports History'),
        automaticallyImplyLeading: false,
        backgroundColor: overallcolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 170,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => CustomAlertDialog(
                                title: "Guest Full Detail",
                                Columnc: <Widget>[
                                  Text(
                                    'Guest Name:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Fuzail Raza',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Guest Description:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'A problem statement is a concise description of an issue to be addressed or a condition to be improved upon. It identifies the gap between the current (problem) state and desired (goal) state of a process or product. Focusing on the facts, the problem statement should be designed to address the Five Ws. ',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Vehicle No:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Rim-7654435',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // GFCard(
                                  //   boxFit: BoxFit.cover,
                                  //   title: GFListTile(
                                  //     title: Text(
                                  //       'Status:',
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold),
                                  //     ),
                                  //     subTitle: Text(
                                  //       'Date: $currentdate',
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.bold),
                                  //     ),
                                  //   ),
                                  //   content: Column(
                                  //     children: [
                                  //       Text(
                                  //         'Check In Date Time: $currentdate $CurrentTime',
                                  //         style: TextStyle(
                                  //             fontWeight: FontWeight.bold),
                                  //       ),
                                  //       Text(
                                  //         'Check Out Date Time: $currentdate $CurrentTime',
                                  //         style: TextStyle(
                                  //             fontWeight: FontWeight.bold),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: new Container(
                                        padding: new EdgeInsets.all(16.0),
                                        decoration: new BoxDecoration(
                                            color: const Color(0xFF33b17c),
                                            borderRadius:
                                                BorderRadius.circular(30)),
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
                                  ),
                                ],
                              ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: ListTile(
                        title: Text('Guest 1'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Date: ${currentdate}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 5),
        ),
      ),
    );
  }
}
