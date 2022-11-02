import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Utils/constants.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';
import 'package:userapp/Widgets/My%20TextForm%20Field/my_textform_field.dart';
import '../../Controller/Report to Admin Controller/report_to_admin_controller.dart';



class ReportToAdmin extends GetView {
final AddReportToAdminController addReportToAdminController = Get.put(AddReportToAdminController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(' Report to Admin'),
        backgroundColor: overallcolor,
      ),
      body: GetBuilder<AddReportToAdminController>(
          init: AddReportToAdminController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
              child: Container(
                child: Form(
                  key: controller.formKey,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 30),
                    child: ListView(
                      children: <Widget>[
                        // second Element

                        MyTextFormField(
                          controller: controller.reportTitleController,
                          hintTextColor: primaryColor,
                          fillVisibility: true,
                          fillColor: Colors.white,
                          validator: emptyStringValidator,
                            padding: EdgeInsets.all(8),
                            hintText: 'Enter Report Title',
                            labelText: 'Report Title',
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor)
                       ,
                        SizedBox(
                          height: 10,
                        ),

                        //third Element
                        MyTextFormField(
                            controller: controller.reportDescriptionController,
                            hintTextColor: primaryColor,
                            fillVisibility: true,
                            fillColor: Colors.white,
                            validator: emptyStringValidator,
                            padding: EdgeInsets.all(8),
                            hintText: 'Enter Report Description',
                            labelText: 'Report Description',
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor)
                        ,

                        SizedBox(
                          height: 10,
                        ),

                        MyTextFormField(onTap: (){
                          controller.Date(context);


                        },
                            controller: controller.dateController,
                            hintTextColor: primaryColor,
                            fillVisibility: true,
                            fillColor: Colors.white,
                            validator: emptyStringValidator,
                            padding: EdgeInsets.all(8),
                            hintText: 'Enter Report Date',
                            labelText: 'Report Date',
                            onFocusedBorderColor: primaryColor,
                            onEnabledBorderColor: primaryColor),
                        SizedBox(
                          height: 10,
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        MyButton(backgroundColor: primaryColor,
                          onPressed: (){
                          if (controller.formKey.currentState!
                              .validate()) {

controller.reportToAdminApi(
    token: controller.userdata.bearerToken!,
    subadminid: controller.userdata.subadminid!,
    userid: controller.userdata.userid!,
    title: controller.reportTitleController.text,
     date: controller.dateController.text,
   description: controller.reportDescriptionController.text


);



                          } else {
                            return null;
                          }
                        },
                            horizontalPadding: 8,
                            verticalPadding: 8, child: Text('Submit Report '
                              ,


                          ),)
                        // fourth Element

                        // sixth Element

                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
