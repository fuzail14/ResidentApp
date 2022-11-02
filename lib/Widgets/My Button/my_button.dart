import 'package:flutter/material.dart';
class MyButton extends StatefulWidget {
  final double horizontalPadding ;
  final double verticalPadding ;
  final double? height;
  final double? width;
  final double? border;

  final Color? backgroundColor;
  final Color? foregroundColor;

  final Widget child;
  final void Function()? onPressed;

   MyButton({super.key,this.foregroundColor,this.backgroundColor,required this.child,
  required this.horizontalPadding,required this.verticalPadding, this.height,this.width, this.border, this.onPressed});


  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return   Padding(padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding, vertical: widget.verticalPadding),
      child: Container(
        width: widget.width,
        height:widget.height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              foregroundColor: widget.foregroundColor,
            backgroundColor: widget.backgroundColor

          ),
          child:  widget.child,
          onPressed: widget.onPressed,
        ),
      ),
    )
    ;
  }
}
