import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyBackButton extends StatelessWidget {
  final String? text;
  final Widget? widget;

  const MyBackButton({ this.text,this.widget});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 38, top: 74),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(

             child:  SvgPicture.asset(
               "assets/arrow_back.svg",

             ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text!,
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black),
          ),
          Container(child: widget,)

        ],
      ),
    );
  }
}