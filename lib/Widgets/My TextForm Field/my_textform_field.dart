
import 'package:flutter/material.dart';
class MyTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry padding;
  final int? maxLines;
  final bool? fillVisibility;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? labelText;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? fillColor;
  final Color onFocusedBorderColor;
  final Color onEnabledBorderColor;

  final String? Function(String?)? validator;
  final void Function()? onTap;
  MyTextFormField(
      {super.key,
      required this.padding,
      this.onChanged,
      this.maxLines,
      this.fillVisibility,
      this.keyboardType,
      this.onTap,
      this.controller,
      this.fillColor,
      this.validator,
      required this.hintText,
      this.labelTextColor,
      required this.labelText,
      this.hintTextColor,
      required this.onFocusedBorderColor,
      required this.onEnabledBorderColor});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding:widget.padding ,
      child: TextFormField(
        onChanged:widget.onChanged ,
        keyboardType: widget.keyboardType,
        onTap: widget.onTap,
        validator: widget.validator,
        maxLines: widget.maxLines,
        controller: widget.controller,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: widget.labelTextColor,
          ),
          hintStyle: TextStyle(
            color: widget.hintTextColor,
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          fillColor: widget.fillColor,
          filled: widget.fillVisibility,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide:
                BorderSide(color: widget.onFocusedBorderColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: widget.onEnabledBorderColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
