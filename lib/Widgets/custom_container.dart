import 'package:flutter/material.dart';
import 'package:userapp/Utils/constants.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({this.onTap, this.title,this.Icon});
    
    

  void Function()? onTap;
  String? title;
  dynamic Icon;
    

    
  @override
  Widget build(BuildContext context) {
    return 
      GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height*0.100,
        width: MediaQuery.of(context).size.height*0.100,
        decoration: BoxDecoration(

            // color: primaryColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: overallcolor,
              width: 2,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icon,
            //   color: overallcolor,
            // ),
            Icon,
            
            Text(
              title!,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  
  
    
  }
}
