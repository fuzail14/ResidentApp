import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  CustomAlertDialog({required this.title, required this.Columnc});
  String? title;
  dynamic Columnc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: EdgeInsets.only(top: 10.0),
      title: Text(title!),
      content: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: Columnc))),
    );
  }
}
