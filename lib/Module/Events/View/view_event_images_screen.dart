import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';



class ViewEventImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('');
      // Scaffold(
      //   backgroundColor: Colors.black,
      //   body: SafeArea(
      //       child: GetBuilder<EventScreenController>(
      //           init: EventScreenController(),
      //           builder: (controller) {
      //             var len = controller.imageFileList!.length;
      //             print('len $len');
      //             return MasonryGridView.count(
      //               crossAxisCount: 2,
      //               mainAxisSpacing: 15,
      //               crossAxisSpacing: 4,
      //               itemCount: len,
      //               itemBuilder: (context, index) {
      //                 return GestureDetector(
      //                   onTap: () {
      //                     Get.to(() => ViewImage(
      //                           img: controller.imageFileList![index].path
      //                               .toString(),
      //                           tag: controller.imageFileList![index].path
      //                               .toString(),
      //                         ));
      //                   },
      //                   child: Container(
      //                     decoration: BoxDecoration(
      //                         color: Colors.transparent,
      //                         borderRadius:
      //                             BorderRadius.all(Radius.circular(15))),
      //                     child: ClipRRect(
      //                         borderRadius:
      //                             BorderRadius.all(Radius.circular(15)),
      //                         child: Hero(
      //                           tag: controller.imageFileList![index].path
      //                               .toString(),
      //                           child: Image.file(File(
      //                               controller.imageFileList![index].path)),
      //                         )),
      //                   ),
      //                 );
      //               },
      //             );
      //           })));
  }
}
