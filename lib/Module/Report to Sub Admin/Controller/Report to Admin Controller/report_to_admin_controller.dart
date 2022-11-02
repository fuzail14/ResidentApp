import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:userapp/Routes/set_routes.dart';

import '../../../../Constants/api_routes.dart';
import '../../../Login/Model/User.dart';

class AddReportToAdminController extends GetxController {
  var user = Get.arguments;
  late final User userdata;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    this.userdata = user;
    print(userdata.userid);
    print(userdata.bearerToken);
    print(userdata.subadminid);

  }

  final formKey = new GlobalKey<FormState>();

  TextEditingController reportTitleController = TextEditingController();
  TextEditingController reportDescriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Future Date(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030),
        context: context);
    if (picked != null) picked.toString();
    dateController.text = picked.toString().split(' ')[0];
    update();
  }

  Future reportToAdminApi({
    required int userid,
    required String token,
    required String title,
    required String description,
    required String date,
    required int subadminid,

  }) async {
    print(userid);
    print(subadminid);
    print(token);
    print(title);
    print(description);
    print(date);

    final response = await Http.post(
      Uri.parse(Api.report_to_admin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "userid": userid,
        "subadminid": subadminid,
        "title": title,
        "description": description,
        "date": date,
        "status": "0",
        "statusdescription": "pending",
      }),
    );

    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);

      Get.offAndToNamed(adminreports,arguments: user);

      Get.snackbar("Report Submitted  Successfully", "");
    } else {
      Get.snackbar("Failed to Submit Report", "");
    }
  }
}
