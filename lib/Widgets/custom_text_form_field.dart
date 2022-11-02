import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.keyboardType,
      this.controller,
      this.validator,
      this.onChanged,
      this.labelText});
  TextInputType? keyboardType;
  TextEditingController? controller;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Color(0xffF4F4F4)),
          ),
          filled: true,
          fillColor: Color(0xffFFFFFF),
          labelText: labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(15.0),
          )),
     
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      
    );
  }
}
