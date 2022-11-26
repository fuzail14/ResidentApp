import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Login/Model/User.dart';

class HomeScreenController extends GetxController
{

  var user = Get.arguments;
  late final User userdata;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('Home Screen Controller Data');
    this.userdata=user;
    print(userdata.userid);

    print(userdata.bearerToken);
  }






}