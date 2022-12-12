import 'dart:io';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:userapp/Module/Signup/Resident%20Address%20Detail/Controller/resident_address_controller.dart';
import 'package:userapp/Module/Signup/Resident%20Address%20Detail/Model/Phase.dart';

import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
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
                    //  ListTile(
                    //   leading: Icon(
                    //     Icons.logout,
                    //   ),
                    //   title: const Text('Logout'),
                    //   onTap: () {
                    //     MySharedPreferences.deleteUserData();
                    //     Get.offAllNamed(loginscreen);
                    //   },
                    // ),

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
                            child: DropdownButtonFormField(
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
                              validator: (value) => value == null
                                  ? 'Please Select Society'
                                  : null,
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
                                      child: DropdownButtonFormField(
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
                                        validator: (value) => value == null
                                            ? 'Please Select Society Name'
                                            : null,
                                        items: controller.societieslist
                                            .map((items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items.name!),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          controller.SelectedSociety(newValue);

                                          controller.phaseli.clear();
                                          controller.phaseslist.clear();
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
                    Padding(
                      padding:  EdgeInsets.all(18),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                "Select Phase",
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
                              child: DropdownButtonFormField(
                                validator: (value) => value == null
                                    ? 'Please Select Phase'
                                    : null,
                                isExpanded: true,
                                style: GoogleFonts.ubuntu(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: HexColor('#4D4D4D')),
                                value: controller.phasesval,
                                icon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: primaryColor,
                                ),
                                items: controller.phaseslist.map((items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items.name!),
                                  );
                                }).toList(),
                                onTap: () {},
                                onChanged: (newValue) {
                                  controller.SelectedPhase(newValue);
                                },
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                "Select Block",
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
                              child: DropdownButtonFormField(
                                validator: (value) => value == null
                                    ? 'Please Select Block'
                                    : null,
                                isExpanded: true,
                                style: GoogleFonts.ubuntu(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: HexColor('#4D4D4D')),
                                value: controller.blockval,
                                icon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: primaryColor,
                                ),
                                items: controller.blocklist.map((items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items.name!),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  controller.SelectedBlock(newValue);
                                },
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                "Select Street",
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
                              child: DropdownButtonFormField(
                                validator: (value) => value == null
                                    ? 'Please Select Street'
                                    : null,
                                isExpanded: true,
                                style: GoogleFonts.ubuntu(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: HexColor('#4D4D4D')),
                                value: controller.streetval,
                                icon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: primaryColor,
                                ),
                                items: controller.streetlist.map((items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items.name!),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  controller.SelectedStreet(newValue);
                                },
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                "Select House",
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
                              child: DropdownButtonFormField(
                                validator: (value) => value == null
                                    ? 'Please Select House'
                                    : null,
                                isExpanded: true,
                                style: GoogleFonts.ubuntu(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: HexColor('#4D4D4D')),
                                value: controller.houseval,
                                icon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: primaryColor,
                                ),
                                items: controller.houselist.map((items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items.address!),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  controller.SelectedHouse(newValue);
                                },
                              ),
                            ),
                          ]),
                    ),
                    MyTextFormField(
                        controller: controller.houseaddressdetailController,
                        hintText: 'House Address',
                        labelText: 'House Address Detail (optional)',
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),

                    MyTextFormField(
                        controller: controller.vehiclenoController,
                        hintText: 'Vehicle No',
                        labelText: 'Vehicle No (optional)',
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor),

                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                "Select Resident Type",
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
                                value: controller.rentalorowner,
                                icon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: primaryColor,
                                ),
                                items: controller.rentalorownerlist
                                    .map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  controller.SelectedRentalOrOwner(newValue);
                                },
                              ),
                            ),
                          ]),
                    ),
                    controller.rentalorowner == 'Rental'
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
                                if (controller.state == null ||
                                    controller.city == null ||
                                    controller.getsocietyid == null ||
                                    controller.getPhaseid == null ||
                                    controller.getBlockid == null ||
                                    controller.getStreetid == null ||
                                    controller.getHouseid == null ||
                                    controller.rentalorowner == null) {
                                  Get.snackbar('Information Missing',
                                      'Please Provide All iNformation');
                                }

                                controller.addResidentApi(
                                    subadminid: controller.getsubadminid,
                                    residentid: controller.user!.userid!,
                                    country: controller.country,
                                    state: controller.state,
                                    city: controller.city,
                                    societyid: controller.getsocietyid,
                                    phaseid: controller.getPhaseid,
                                    blockid: controller.getBlockid,
                                    streetid: controller.getStreetid,
                                    houseid: controller.getHouseid,
                                    houseaddress: controller
                                        .houseaddressdetailController.text,
                                    residentalType: controller.rentalorowner,
                                    propertyType: controller.propertytype,
                                    vechileno:
                                        controller.vehiclenoController.text,
                                    bearerToken: controller.user!.bearerToken!,
                                    ownerName:
                                        controller.ownernameController.text,
                                    ownerPhoneNo: controller
                                        .ownerphonenumController.text);

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
