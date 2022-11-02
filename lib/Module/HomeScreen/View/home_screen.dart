import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:userapp/Module/HomeScreen/Controller/home_screen_controller.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Services/Shared%20Preferences/MySharedPreferences.dart';
import 'package:userapp/Utils/constants.dart';
import 'package:userapp/Widgets/custom_container.dart';

import '../../../Utils/custom_alert_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController _homeScreenController =
      Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Home'),
          backgroundColor: overallcolor,
          actions: <Widget>[
            // IconBadge(
            //   icon: Icon(Icons.notifications_none),
            //   itemCount: 100,
            //   badgeColor: Colors.red,
            //   maxCount: 99,
            //   hideZero: true,
            //   onTap: () {
            //     Get.toNamed(notificationsscreen);
            //   },
            // ),

          ]),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(children: [
            Text(
              'Reports',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              color: overallcolor,
              thickness: 2,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CustomContainer(
                  onTap: () {
                    Get.toNamed(adminreports,
                        arguments: _homeScreenController.userdata);
                  },
                  title: 'Report To Admin',
                  Icon: Icon(Icons.admin_panel_settings, color: overallcolor)),
              CustomContainer(
                onTap: () {
                  Get.toNamed(reporttogatekeeperscreen);
                },
                title: 'Report To GateKeeper',
                Icon: Icon(Icons.person_add, color: overallcolor),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                      Get.toNamed(reportshistoryscreen,arguments: _homeScreenController.user);
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                      Get.toNamed(eventsscreen,arguments: _homeScreenController.user);
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
                      Get.toNamed(noticeboardscreen,arguments: _homeScreenController.user);
                    },
                    title: 'Notice Board',
                    Icon: Icon(Icons.notification_add, color: overallcolor)),
              ],
            ),
          ]),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: overallcolor,
      //     onPressed: () {
      //       Get.toNamed(chatavailbilityscreen);
      //     },
      //     child: const Icon(Icons.chat)),
    );
  }
}
