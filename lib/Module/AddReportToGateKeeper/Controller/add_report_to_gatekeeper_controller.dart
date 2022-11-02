import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReportToGateKeeperController extends GetxController {
  final formKey = new GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController cnicController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController vehiclenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? imageFile;

  TextEditingController startdate = TextEditingController();
  TextEditingController guestVehicleNo = TextEditingController();
  TextEditingController guesttime = TextEditingController();

  Future StartDate(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030),
        context: context);
    if (picked != null) picked.toString();
    startdate.text = picked.toString().split(' ')[0];
    update();
  }

  Future GuestTime(context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
    );
    print('timeee.$picked');
    var currentTime =
        '${picked!.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}:${picked.period.toString().split('.')[1]}';

 currentTime.toString();
    guesttime.text = currentTime.toString().split(' ')[0].trim();
    update();
  }

}
