import 'dart:io';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:userapp/Module/Signup/Resident%20Address%20Detail/Controller/resident_address_controller.dart';

import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Back Button/my_back_button.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../../Login/Model/User.dart';

class ResidentAddressDetail extends StatefulWidget {
  @override
  State<ResidentAddressDetail> createState() => _ResidentAddressDetailState();
}

class _ResidentAddressDetailState extends State<ResidentAddressDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ResidentAddressDetailController>(
          init: ResidentAddressDetailController(),
          builder: (controller) {
            return Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MyBackButton(
                      text: 'Address Detail',
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.060),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: CSCPicker(
                          defaultCountry: DefaultCountry.Pakistan,
                          showStates: true,
                          showCities: true,
                          flagState: CountryFlag.ENABLE,
                          dropdownDecoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1)),
                          disabledDropdownDecoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.grey.shade300,
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1)),
                          stateSearchPlaceholder: "State",
                          citySearchPlaceholder: "City",
                          stateDropdownLabel: "*State",
                          cityDropdownLabel: "*City",
                          selectedItemStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          dropdownHeadingStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          dropdownItemStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          dropdownDialogRadius: 10.0,
                          searchBarRadius: 10.0,
                          onCountryChanged: (val) {
                            controller.country = val.toString();
                          },
                          onStateChanged: (value) {
                            controller.state = value.toString();
                          },
                          onCityChanged: (value) {
                            controller.city = value.toString();
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              "Select Residential Type",
                              style: GoogleFonts.ubuntu(
                                  fontStyle: FontStyle.normal,
                                  // color: secondaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: HexColor('#4D4D4D')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              isExpanded: true,
                              style: GoogleFonts.ubuntu(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: HexColor('#4D4D4D')),
                              value: controller.societyorbuildingval,
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: primaryColor,
                              ),
                              items: controller.societyorbuildinglist
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.RentalOrOwner(newValue);
                              },
                            ),
                          ),
                          (controller.societyorbuildingval == 'Society')
                              ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "Select Society",
                                        style: GoogleFonts.ubuntu(
                                            fontStyle: FontStyle.normal,

                                            // color: secondaryColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: HexColor('#4D4D4D')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        style: GoogleFonts.ubuntu(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14,
                                            color: HexColor('#4D4D4D')),
                                        value: controller.societiesname,
                                        icon: Icon(
                                          Icons.arrow_drop_down_sharp,
                                          color: primaryColor,
                                        ),
                                        items: controller.societieslist
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          controller.SelectedSociety(newValue);
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "Select Building",
                                        style: GoogleFonts.ubuntu(
                                            fontStyle: FontStyle.normal,

                                            // color: secondaryColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: HexColor('#4D4D4D')),
                                      ),
                                    ),
                                       Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              isExpanded: true,
                              style: GoogleFonts.ubuntu(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: HexColor('#4D4D4D')),
                              value: controller.buildingsname,
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: primaryColor,
                              ),
                              items: controller.buildingslist
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.SelectedBuilding(newValue);
                              },
                            ),
                          ),
                       
                                ],
                              ),
                       
                        ],
                      ),
                    ),
                    MyTextFormField(
                      controller: controller.firstnameController,
                      maxLines: 1,
                      validator: emptyStringValidator,
                      hintText: 'First Name',
                      labelText: 'Enter First Name',
                      onFocusedBorderColor: primaryColor,
                      onEnabledBorderColor: primaryColor,
                    ),
                    MyTextFormField(
                        controller: controller.lastnameController,
                        validator: emptyStringValidator,
                        hintText: 'Last Name',
                        labelText: 'Enter Last Name',
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                    MyTextFormField(
                        controller: controller.cnicController,
                        validator: emptyStringValidator,
                        hintText: 'Cnic',
                        labelText: 'Enter Cnic',
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                    MyTextFormField(
                        controller: controller.vehiclenoController,
                        validator: emptyStringValidator,
                        hintText: 'Vechile No',
                        labelText: 'Enter Vechile No',
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                    MyTextFormField(
                        controller: controller.addressController,
                        validator: emptyStringValidator,
                        hintText: 'Address',
                        labelText: 'Enter Address',
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                    MyTextFormField(
                        controller: controller.mobileNoController,
                        validator: emptyStringValidator,
                        hintText: 'Mobile No',
                        labelText: 'Enter Mobile No',
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),
                    MyPasswordTextFormField(
                      maxLines: 1,
                      controller: controller.passwordController,
                      obscureText: controller.isHidden,
                      togglePasswordView: controller.togglePasswordView,
                      validator: emptyStringValidator,
                      hintText: 'Enter Password',
                      labelText: 'Password',
                      onFocusedBorderColor: primaryColor,
                      onEnabledBorderColor: primaryColor,
                    ),
                    controller.societyorbuildingval == 'Rental'
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  'Enter Owner Details',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              MyTextFormField(
                                  controller: controller.ownernameController,
                                  validator: emptyStringValidator,
                                  hintText: 'Owner Name',
                                  labelText: 'Enter Owner Name',
                                  onFocusedBorderColor: primaryColor,
                                  onEnabledBorderColor: primaryColor),
                              MyTextFormField(
                                  controller: controller.owneraddressController,
                                  validator: emptyStringValidator,
                                  hintText: ' Owner Address',
                                  labelText: 'Enter Owner Address',
                                  onFocusedBorderColor: primaryColor,
                                  onEnabledBorderColor: primaryColor),
                              MyTextFormField(
                                  controller:
                                      controller.ownerphonenumController,
                                  validator: emptyStringValidator,
                                  hintText: 'Owner Phone No',
                                  labelText: 'Enter Phone No',
                                  onFocusedBorderColor: primaryColor,
                                  onEnabledBorderColor: primaryColor),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    MyButton(
                      onPressed: controller.isLoading
                          ? null
                          : () {
                              if (controller.formKey.currentState!.validate()) {
                                if (controller.imageFile?.path == null) {
                                  Get.snackbar('Warning', 'Select an image !');
                                } else {
                                  //User user = controller.user;

                                  // controller.addResidentApi(
                                  //     ownerName:
                                  //     controller.ownernameController.text,
                                  //     ownerAddress:
                                  //     controller.owneraddressController.text,
                                  //     ownerPhoneNo:
                                  //     controller.ownerphonenumController.text,
                                  //     file: controller.imageFile,
                                  //     residentalType: controller.rentalorownerval,
                                  //     propertyType: controller.houseorapartment,
                                  //     firstName:
                                  //     controller.firstnameController.text,
                                  //     lastName: controller.lastnameController.text,
                                  //     cnic: controller.cnicController.text,
                                  //     vechileno:
                                  //     controller.vehiclenoController.text,
                                  //     address: controller.addressController.text,
                                  //     mobileno: controller.mobileNoController.text,
                                  //     password: controller.passwordController.text,
                                  //     bearerToken: user.bearerToken!,
                                  //     subadminid: user.userid!);

                                }
                                // Get.offAndToNamed(viewuser);
                              }
                            },
                      textColor: Colors.white,
                      color: primaryColor,
                      name: 'Save',
                      outlinedBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
