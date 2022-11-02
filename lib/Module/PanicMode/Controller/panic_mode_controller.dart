import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PanicModeController extends GetxController {
  bool selectedButton = false;

  var problemsList = ["Fire", 'Thief', 'Health', 'Other'];

  int? selectedProblemIndex;

  selectedProblem(var index) {
    selectedProblemIndex = index;
    
  

    selectedButton = true;

    update();
  }
}
