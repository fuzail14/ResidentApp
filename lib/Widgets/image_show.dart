import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewImage extends StatefulWidget {
  @override
  State<ViewImage> createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  var arguments = Get.arguments;

  String? img;
  String? tag;

  @override
  Widget build(BuildContext context) {
    img = arguments[0];
    tag = arguments[1];
    return Scaffold(
        backgroundColor: Colors.black,
        body: Hero(
          tag: tag!,
          child: Center(child: Image.asset(img!)),
        ));
  }
}
