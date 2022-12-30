import 'dart:io';
import 'package:csc_picker/csc_picker.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:userapp/Module/Signup/Resident%20Address%20Detail/Controller/resident_address_controller.dart';
import 'package:userapp/Module/Signup/Resident%20Address%20Detail/Model/Apartment.dart';
import 'package:userapp/Module/Signup/Resident%20Address%20Detail/Model/Floor.dart';
import 'package:userapp/Module/Signup/Resident%20Address%20Detail/Model/Phase.dart';
import 'package:userapp/Module/Signup/Resident%20Address%20Detail/Model/Street.dart';
import 'package:userapp/Module/Signup/Resident%20Address%20Detail/Model/block.dart';

import '../../../../Constants/api_routes.dart';
import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../../Widgets/My Back Button/my_back_button.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../../Login/Model/User.dart';
import '../Model/Society.dart';
import '../Model/house.dart';

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
                                controller.SocietyOrBuilding(newValue);
                              },
                            ),
                          ),
                          (controller.societyorbuildingval == 'society')
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
                                      // child: DropdownButtonFormField(

                                      //   isExpanded: true,
                                      //   style: GoogleFonts.ubuntu(
                                      //       fontStyle: FontStyle.normal,
                                      //       fontWeight: FontWeight.w300,
                                      //       fontSize: 14,
                                      //       color: HexColor('#4D4D4D')),
                                      //   value: controller.societiesname,
                                      //   icon: Icon(
                                      //     Icons.arrow_drop_down_sharp,
                                      //     color: primaryColor,
                                      //   ),
                                      //   validator: (value) => value == null
                                      //       ? 'Please Select Society Name'
                                      //       : null,
                                      //   items: controller.societieslist
                                      //       .map((items) {
                                      //     return DropdownMenuItem(
                                      //       value: items,
                                      //       child: (controller.societieslist == null)? CircularProgressIndicator():
                                      //        Text(items.name!),
                                      //     );
                                      //   }).toList(),
                                      //   onChanged: (newValue) {
                                      //     controller.SelectedSociety(newValue);
                                      //   },
                                      // ),

                                      child: DropdownSearch<Society>(
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller.viewAllSocietiesApi(
                                              controller.societyorbuildingval,
                                              controller.token);
                                        },
                                        onChanged: (Society? data) {
                                          controller.SelectedSociety(data!);
                                        },
                                        selectedItem: controller.societiesname,
                                        itemAsString: (Society society) {
                                          return society.name.toString();
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(18),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              // child: DropdownButtonFormField(
                                              //   validator: (value) =>
                                              //       value == null
                                              //           ? 'Please Select Phase'
                                              //           : null,
                                              //   isExpanded: true,
                                              //   style: GoogleFonts.ubuntu(
                                              //       fontStyle: FontStyle.normal,
                                              //       fontWeight: FontWeight.w300,
                                              //       fontSize: 14,
                                              //       color: HexColor('#4D4D4D')),
                                              //   value: controller.phasesval,
                                              //   icon: Icon(
                                              //     Icons.arrow_drop_down_sharp,
                                              //     color: primaryColor,
                                              //   ),
                                              //   items: controller.phaseslist
                                              //       .map((items) {
                                              //     return DropdownMenuItem(
                                              //       value: items,
                                              //       child: Text(items.name!),
                                              //     );
                                              //   }).toList(),
                                              //   onTap: () {},
                                              //   onChanged: (newValue) {
                                              //     controller.SelectedPhase(
                                              //         newValue);
                                              //   },
                                              // ),

                                              child: DropdownSearch<Phase>(
                                                asyncItems:
                                                    (String filter) async {
                                                  print(filter);
                                                  return controller
                                                      .viewAllPhasesApi(controller
                                                          .selectedsocietyid);
                                                },
                                                onChanged: (Phase? data) {
                                                  controller.SelectedPhase(
                                                      data);
                                                },
                                                selectedItem:
                                                    controller.phasesval,
                                                itemAsString: (Phase p) {
                                                  return p.name.toString();
                                                },
                                              ),
                                            )
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              // child: DropdownButtonFormField(
                                              //   validator: (value) =>
                                              //       value == null
                                              //           ? 'Please Select Block'
                                              //           : null,
                                              //   isExpanded: true,
                                              //   style: GoogleFonts.ubuntu(
                                              //       fontStyle: FontStyle.normal,
                                              //       fontWeight: FontWeight.w300,
                                              //       fontSize: 14,
                                              //       color: HexColor('#4D4D4D')),
                                              //   value: controller.blockval,
                                              //   icon: Icon(
                                              //     Icons.arrow_drop_down_sharp,
                                              //     color: primaryColor,
                                              //   ),
                                              //   items: controller.blocklist
                                              //       .map((items) {
                                              //     return DropdownMenuItem(
                                              //       value: items,
                                              //       child: Text(items.name!),
                                              //     );
                                              //   }).toList(),
                                              //   onChanged: (newValue) {
                                              //     controller.SelectedBlock(
                                              //         newValue);
                                              //   },
                                              // ),

                                              child: DropdownSearch<Block>(
                                                asyncItems:
                                                    (String filter) async {
                                                  print(filter);
                                                  return controller
                                                      .viewAllBlocksApi(
                                                          controller
                                                              .selectedphaseid);
                                                },
                                                onChanged: (Block? data) {
                                                  controller.SelectedBlock(
                                                      data);
                                                },
                                                selectedItem:
                                                    controller.blockval,
                                                itemAsString: (Block p) {
                                                  return p.name.toString();
                                                },
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              // child: DropdownButtonFormField(
                                              //   validator: (value) =>
                                              //       value == null
                                              //           ? 'Please Select Street'
                                              //           : null,
                                              //   isExpanded: true,
                                              //   style: GoogleFonts.ubuntu(
                                              //       fontStyle: FontStyle.normal,
                                              //       fontWeight: FontWeight.w300,
                                              //       fontSize: 14,
                                              //       color: HexColor('#4D4D4D')),
                                              //   value: controller.streetval,
                                              //   icon: Icon(
                                              //     Icons.arrow_drop_down_sharp,
                                              //     color: primaryColor,
                                              //   ),
                                              //   items: controller.streetlist
                                              //       .map((items) {
                                              //     return DropdownMenuItem(
                                              //       value: items,
                                              //       child: Text(items.name!),
                                              //     );
                                              //   }).toList(),
                                              //   onChanged: (newValue) {
                                              //     controller.SelectedStreet(
                                              //         newValue);
                                              //   },
                                              // ),

                                              child: DropdownSearch<Street>(
                                                asyncItems:
                                                    (String filter) async {
                                                  print(filter);
                                                  return controller
                                                      .viewAllStreetsApi(
                                                          controller
                                                              .selectedblockid);
                                                },
                                                onChanged: (Street? data) {
                                                  controller.SelectedStreet(
                                                      data);
                                                },
                                                selectedItem:
                                                    controller.streetval,
                                                itemAsString: (Street p) {
                                                  return p.name.toString();
                                                },
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              // child: DropdownButtonFormField(
                                              //   validator: (value) =>
                                              //       value == null
                                              //           ? 'Please Select House'
                                              //           : null,
                                              //   isExpanded: true,
                                              //   style: GoogleFonts.ubuntu(
                                              //       fontStyle: FontStyle.normal,
                                              //       fontWeight: FontWeight.w300,
                                              //       fontSize: 14,
                                              //       color: HexColor('#4D4D4D')),
                                              //   value: controller.houseval,
                                              //   icon: Icon(
                                              //     Icons.arrow_drop_down_sharp,
                                              //     color: primaryColor,
                                              //   ),
                                              //   items: controller.houselist
                                              //       .map((items) {
                                              //     return DropdownMenuItem(
                                              //       value: items,
                                              //       child: Text(items.address!),
                                              //     );
                                              //   }).toList(),
                                              //   onChanged: (newValue) {
                                              //     controller.SelectedHouse(
                                              //         newValue);
                                              //   },
                                              // ),

                                              child: DropdownSearch<House>(
                                                asyncItems:
                                                    (String filter) async {
                                                  print(filter);
                                                  return controller
                                                      .viewAllHousesApi(
                                                          controller
                                                              .selectedstreetid);
                                                },
                                                onChanged: (House? data) {
                                                  controller.SelectedHouse(
                                                      data);
                                                },
                                                selectedItem:
                                                    controller.houseval,
                                                itemAsString: (House p) {
                                                  return p.address.toString();
                                                },
                                              ),
                                            ),
                                          ]),
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
                                      // child: DropdownButton(
                                      //   isExpanded: true,
                                      //   style: GoogleFonts.ubuntu(
                                      //       fontStyle: FontStyle.normal,
                                      //       fontWeight: FontWeight.w300,
                                      //       fontSize: 14,
                                      //       color: HexColor('#4D4D4D')),
                                      //   value: controller.buildingsname,
                                      //   icon: Icon(
                                      //     Icons.arrow_drop_down_sharp,
                                      //     color: primaryColor,
                                      //   ),
                                      //   items: controller.buildingslist
                                      //       .map((items) {
                                      //     return DropdownMenuItem(
                                      //       value: items,
                                      //       child: Text(items.name!),
                                      //     );
                                      //   }).toList(),
                                      //   onChanged: (newValue) {
                                      //     controller.SelectedBuilding(newValue);
                                      //   },
                                      // ),

                                      child: DropdownSearch<Society>(
                                        asyncItems: (String filter) async {
                                          print(filter);
                                          return controller.viewAllBuildingsApi(
                                            controller.societyorbuildingval,
                                          );
                                        },
                                        onChanged: (Society? data) {
                                          controller.SelectedBuilding(data!);
                                        },
                                        selectedItem: controller.societiesname,
                                        itemAsString: (Society society) {
                                          return society.name.toString();
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(18),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
                                              child: Text(
                                                "Select Floor",
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    // color: secondaryColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: HexColor('#4D4D4D')),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              // child: DropdownButtonFormField(
                                              //   validator: (value) =>
                                              //       value == null
                                              //           ? 'Please Select Floor'
                                              //           : null,
                                              //   isExpanded: true,
                                              //   style: GoogleFonts.ubuntu(
                                              //       fontStyle: FontStyle.normal,
                                              //       fontWeight: FontWeight.w300,
                                              //       fontSize: 14,
                                              //       color: HexColor('#4D4D4D')),
                                              //   value: controller.floorsval,
                                              //   icon: Icon(
                                              //     Icons.arrow_drop_down_sharp,
                                              //     color: primaryColor,
                                              //   ),
                                              //   items: controller.floorslist
                                              //       .map((items) {
                                              //     return DropdownMenuItem(
                                              //       value: items,
                                              //       child: Text(items.name!),
                                              //     );
                                              //   }).toList(),
                                              //   onTap: () {},
                                              //   onChanged: (newValue) {
                                              //     controller.SelectedFloor(
                                              //         newValue);
                                              //   },
                                              // ),

                                              child: DropdownSearch<Floor>(
                                                asyncItems:
                                                    (String filter) async {
                                                  print(filter);
                                                  return controller
                                                      .viewAllFloorsApi(
                                                    controller
                                                        .selectedbuildingid,
                                                  );
                                                },
                                                onChanged: (Floor? data) {
                                                  controller.SelectedFloor(
                                                      data!);
                                                },
                                                selectedItem:
                                                    controller.floorsval,
                                                itemAsString: (Floor floor) {
                                                  return floor.name.toString();
                                                },
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
                                              child: Text(
                                                "Select Apartment",
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    // color: secondaryColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: HexColor('#4D4D4D')),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              // child: DropdownButtonFormField(
                                              //   validator: (value) => value ==
                                              //           null
                                              //       ? 'Please Select Apartment'
                                              //       : null,
                                              //   isExpanded: true,
                                              //   style: GoogleFonts.ubuntu(
                                              //       fontStyle: FontStyle.normal,
                                              //       fontWeight: FontWeight.w300,
                                              //       fontSize: 14,
                                              //       color: HexColor('#4D4D4D')),
                                              //   value: controller.apartmentsval,
                                              //   icon: Icon(
                                              //     Icons.arrow_drop_down_sharp,
                                              //     color: primaryColor,
                                              //   ),
                                              //   items: controller.apartmentslist
                                              //       .map((items) {
                                              //     return DropdownMenuItem(
                                              //       value: items,
                                              //       child: Text(items.name!),
                                              //     );
                                              //   }).toList(),
                                              //   onChanged: (newValue) {
                                              //     controller.SelectedApartment(
                                              //         newValue);
                                              //   },
                                              // ),

                                              child: DropdownSearch<Apartment>(
                                                asyncItems:
                                                    (String filter) async {
                                                  print(filter);
                                                  return controller
                                                      .viewAllApartmentssApi(
                                                    controller.selectedfloorid,
                                                  );
                                                },
                                                onChanged: (Apartment? data) {
                                                  controller.SelectedApartment(
                                                      data!);
                                                },
                                                selectedItem:
                                                    controller.apartmentsval,
                                                itemAsString:
                                                    (Apartment apartment) {
                                                  return apartment.name
                                                      .toString();
                                                },
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                        ],
                      ),
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
                                if (controller.societyorbuildingval ==
                                    'society') {
                                  controller.addResidentApi(
                                      subadminid: controller.getsubadminid,
                                      residentid: controller.user!.userid!,
                                      country: controller.country,
                                      state: controller.state,
                                      city: controller.city,
                                      societyname: controller.getsocietyname,
                                      phasename: controller.getPhasename,
                                      blockname: controller.getBlockname,
                                      streetname: controller.getStreetname,
                                      houseid: controller.getHouseid,
                                      houseaddress: controller
                                          .houseaddressdetailController.text,
                                      residentalType: controller.rentalorowner,
                                      propertyType: controller.propertytype,
                                      vechileno:
                                          controller.vehiclenoController.text,
                                      bearerToken:
                                          controller.user!.bearerToken!,
                                      ownerName:
                                          controller.ownernameController.text,
                                      ownerPhoneNo: controller
                                          .ownerphonenumController.text);
                                } else {
                                  controller.addBuildingResidentApi(
                                      subadminid: controller.getsubadminid,
                                      residentid: controller.user!.userid!,
                                      country: controller.country,
                                      state: controller.state,
                                      city: controller.city,
                                      buildingname: controller.getbuildingname,
                                      floorname: controller.getfloorname,
                                      apartmentid: controller.getapartmentid,
                                      houseaddress: controller
                                          .houseaddressdetailController.text,
                                      residentalType: controller.rentalorowner,
                                      propertyType: controller.propertytype,
                                      vechileno:
                                          controller.vehiclenoController.text,
                                      bearerToken:
                                          controller.user!.bearerToken!,
                                      ownerName:
                                          controller.ownernameController.text,
                                      ownerPhoneNo: controller
                                          .ownerphonenumController.text);
                                }
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
