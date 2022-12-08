import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:userapp/Module/HomeScreen/Controller/home_screen_controller.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Services/Shared%20Preferences/MySharedPreferences.dart';
import 'package:userapp/Utils/constants.dart';
import 'package:userapp/Widgets/custom_container.dart';

import '../../../Constants/constants.dart';
import '../../../Utils/custom_alert_dialog.dart';

class HomeScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      child: Text('Profile'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                      ),
                      title: const Text('Logout'),
                      onTap: () {
                        MySharedPreferences.deleteUserData();
                        Get.offAllNamed(loginscreen);
                      },
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.038,
                              top: MediaQuery.of(context).size.width * 0.078),
                          child: Row(
                            children: [
                              IconButton(
                                  icon:
                                      new SvgPicture.asset('assets/drawer.svg'),
                                  onPressed: () {
                                    controller.scaffoldKey.currentState!
                                        .openDrawer();
                                  }),
                                  
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.190),
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text(
                          'Reports',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Divider(
                          color: overallcolor,
                          thickness: 2,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomContainer(
                                  onTap: () {
                                    Get.toNamed(adminreports,
                                        arguments: controller.userdata);
                                  },
                                  title: 'Report To Admin',
                                  Icon: Icon(Icons.admin_panel_settings,
                                      color: overallcolor)),
                              CustomContainer(
                                onTap: () {
                                  Get.toNamed(gatekeeperreports,
                                      arguments: controller.userdata);
                                },
                                title: 'Report To GateKeeper',
                                Icon:
                                    Icon(Icons.person_add, color: overallcolor),
                              ),
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: []),
                        // Text(
                        //   'Service Provider',
                        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        // ),
                        // Divider(
                        //   color: overallcolor,
                        //   thickness: 2,
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.020,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     CustomContainer(
                        //         onTap: () {
                        //           Get.toNamed(hireserviceproviderscreen);
                        //         },
                        //         title: 'Hire Service Provider',
                        //         Icon: Icon(Icons.room_service, color: overallcolor)),
                        //     CustomContainer(
                        //         onTap: () {
                        //           Get.toNamed(serviceprovidersattendancescreen);
                        //         },
                        //         title: 'Service Provider Attendance',
                        //         Icon: Icon(Icons.history, color: overallcolor)),
                        //   ],
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Histories',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Divider(
                          color: overallcolor,
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomContainer(
                                onTap: () {
                                  Get.toNamed(reportshistoryscreen,
                                      arguments: controller.user);
                                },
                                title: 'Admin Reports History',
                                Icon: Icon(Icons.history, color: overallcolor)),
                            CustomContainer(
                                onTap: () {
                                  Get.toNamed(guestshistoryscreen);
                                },
                                title: 'Guest History',
                                Icon: Icon(Icons.history, color: overallcolor)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Others',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Divider(
                          color: overallcolor,
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomContainer(
                                onTap: () {
                                  Get.toNamed(eventsscreen,
                                      arguments: controller.user);
                                },
                                title: 'Society Events',
                                Icon: Icon(
                                  Icons.event,
                                  color: overallcolor,
                                )),
                            // CustomContainer(
                            //     onTap: () {
                            //       Get.toNamed(panicmodescreen);
                            //     },
                            //     title: 'Panic Mode',
                            //     Icon: Icon(Icons.dangerous, color: overallcolor)),

                            CustomContainer(
                                onTap: () {
                                  Get.toNamed(noticeboardscreen,
                                      arguments: controller.user);
                                },
                                title: 'Notice Board',
                                Icon: Icon(Icons.notification_add,
                                    color: overallcolor)),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              // floatingActionButton: FloatingActionButton(
              //     backgroundColor: overallcolor,
              //     onPressed: () {
              //       Get.toNamed(chatavailbilityscreen);
              //     },
              //     child: const Icon(Icons.chat)),
            ),
          );
        });
  }
}
