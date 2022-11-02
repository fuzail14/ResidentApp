import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Utils/constants.dart';
class ServiceProvidersAttendanceScreen extends StatefulWidget {
  const ServiceProvidersAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceProvidersAttendanceScreen> createState() =>
      _ServiceProvidersAttendanceScreenState();
}

class _ServiceProvidersAttendanceScreenState
    extends State<ServiceProvidersAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Providers Attendance'),
        automaticallyImplyLeading: false,
        backgroundColor: overallcolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    //Get.toNamed(gateKepeerDetailScreen);
                  },
                  child: Container(
                    height: 330,
                    child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 5,
                        shadowColor: Colors.black,
                        color: HexColor("#FFFBE8"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/k.webp'),
                                      //NetworkImage
                                      radius: 60,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        'Name',
                                        style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Column(children: [Text('Hamza')]),
                                    ),
                                  ],
                                ),
                              ), //Text
                              Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 80),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed(viewattendancedetailscreen);
                                    },

                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text(
                                        'VIEW PROFILE',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ), //Padding
                                  ),
                                ),
                              )
                            ])),
                  ));
            },
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
