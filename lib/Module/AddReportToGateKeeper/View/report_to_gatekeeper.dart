

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Utils/constants.dart';

import '../Controller/add_report_to_gatekeeper_controller.dart';

class ReportToGateKeeper extends StatefulWidget {
  @override
  State<ReportToGateKeeper> createState() =>
      _ReportToGateKeeperState();
}

class _ReportToGateKeeperState
    extends State<ReportToGateKeeper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Add Report Detail'),
        backgroundColor: overallcolor,
      ),
      body: GetBuilder<AddReportToGateKeeperController>(
          init: AddReportToGateKeeperController(),
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
                        TextFormField(
                          controller: controller.nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'REPORT TITLE';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            debugPrint('Something changed in Name Text Field');
                            print('value of name $value');
                          },
                          decoration: InputDecoration(
                              labelText: 'REPORT TITLE',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //third Element
                        TextFormField(
                          controller: controller.cnicController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'REPORT DESCRIPTION';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            debugPrint('Something changed in Age Text Field');
                          },
                          decoration: InputDecoration(
                              labelText: 'REPORT DESCRIPTION',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          keyboardType: TextInputType.phone,
                          autocorrect: false,
                          controller: controller.startdate,
                          onSaved: (value) {
                            value.toString().split(' ')[0];
                          },
                          onTap: () {
                            controller.StartDate(context);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 1) {
                              return 'Choose Date';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'DATE',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          autocorrect: false,
                          controller: controller.guesttime,
                          onSaved: (value) {
                            value.toString().split(' ')[0];
                          },
                          onTap: () {
                            controller.GuestTime(context);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 1) {
                              return 'Choose TIME';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'GUEST ARRIVAL TIME',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        

                        // fourth Element
                        TextFormField(
                          // focusNode: _focusNode,
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          controller: controller.guestVehicleNo,
                          onSaved: (value) {
                            value.toString().split(' ')[0];
                          },

                          maxLines: 1,
                          //initialValue: 'Aseem Wangoo',
                          validator: (value) {
                            if (value!.isEmpty || value.length < 1) {
                              return 'GUEST VEHCILE NO';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'GUEST VEHCILE NO',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        // sixth Element
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: overallcolor,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                ),
                                child: Text(
                                  'Save',
                                  textScaleFactor: 1.5,
                                ),
                                onPressed: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.formKey.currentState!.save();
                                    Get.offAndToNamed(reporttogatekeeperscreen);
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
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
