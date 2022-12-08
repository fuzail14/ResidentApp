import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as Http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Constants/api_routes.dart';

class ResidentAddressDetailController extends GetxController {
  //var user = Get.arguments;
  var isHidden = false;
  var isLoading = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController vehiclenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ownernameController = TextEditingController();
  TextEditingController owneraddressController = TextEditingController();
  TextEditingController ownerphonenumController = TextEditingController();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  var imageFile;
  String societyorbuildingval = 'Society';
  String societiesname = 'Bahria';
  String buildingsname = 'Al-Buraq';

  String houseorapartment = 'House';
  var societyorbuildinglist = ['Society', 'Building'];
  var societieslist = ['Bahria', 'DHA', 'Rawat Enclave'];
  var buildingslist = ['Al-Buraq', 'Umair Plaza', 'Some Other Building'];

  var houseorapartmentlist = ['House', 'Apartment'];
  String country = '';
  String state = '';
  String city = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init");
    //print(user);
  }

  getFromGallery(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      print('file picked: $pickedFile');
      // img = pickedFile as Image?;

      print('Assigning Image file');
      imageFile = File(pickedFile.path);
      update();
    } else {}
  }

  getFromCamera(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      print('file picked: $pickedFile');
      // img = pickedFile as Image?;

      print('Assigning Image file');
      imageFile = File(pickedFile.path);
      update();
    } else {}
  }

  RentalOrOwner(val) {
    societyorbuildingval = val;
    update();
  }

  HouseApartment(val) {
    houseorapartment = val;
    update();
  }
  SelectedSociety(val) {
    societiesname = val;
    update();
  }

  SelectedBuilding(val) {
    buildingsname = val;
    update();
  }
  

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }

  // Future addResidentApi(
  //     {required File file,
  //     required String residentalType,
  //     required String propertyType,
  //     required String firstName,
  //     required String lastName,
  //     required String cnic,
  //     required String vechileno,
  //     required String address,
  //     required String mobileno,
  //     required String password,
  //     required String bearerToken,
  //     required int subadminid,
  //     required String ownerName,
  //     required String ownerAddress,
  //     required String ownerPhoneNo}) async {
  //   print('Add Resident Api  Function Call');
  //   print("----Data----");
  //   print(file.path);
  //   print(residentalType);
  //   print(propertyType);
  //   print(firstName);
  //   print(lastName);
  //   print(cnic);
  //   print(vechileno);
  //   print(address);
  //   print(mobileno);
  //   print(password);
  //   print(ownerName);
  //   print(ownerAddress);
  //   print(ownerPhoneNo);
  //   print(bearerToken);
  //   print(subadminid);

  //   print("---------------------------");
  //   Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
  //   var request =
  //       Http.MultipartRequest('POST', Uri.parse(Api.register_resident));
  //   request.headers.addAll(headers);

  //   request.files.add(await Http.MultipartFile.fromPath('image', file.path));
  //   if (residentalType.contains('Rental')) {
  //     print('iam inside rental');
  //     request.fields['firstname'] = firstName;
  //     request.fields['lastname'] = lastName;
  //     request.fields['cnic'] = cnic;
  //     request.fields['address'] = address;
  //     request.fields['mobileno'] = mobileno;
  //     request.fields['roleid'] = 3.toString();
  //     request.fields['rolename'] = 'resident';
  //     request.fields['password'] = password;
  //     request.fields['vechileno'] = vechileno;
  //     request.fields['subadminid'] = subadminid.toString();
  //     request.fields['propertytype'] = propertyType;
  //     request.fields['residenttype'] = residentalType;
  //     request.fields['committeemember'] ="0";
  //     request.fields['ownername'] = ownerName;
  //     request.fields['owneraddress'] = ownerAddress;
  //     request.fields['ownermobileno'] = ownerPhoneNo;
  //     var responsed = await request.send();
  //     var response = await Http.Response.fromStream(responsed);

  //     print(response.statusCode);
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data);
  //       print(response.body);
  //       Get.snackbar("Resident Register Successfully", "");
  //       Get.offAndToNamed(viewuser, arguments: user);
  //     } else if (response.statusCode == 403) {
  //       var data = jsonDecode(response.body.toString());

  //       Get.snackbar(
  //         "Error",
  //         data.toString(),
  //       );
  //     } else {
  //       Get.snackbar("Failed to Register", "");
  //     }
  //   } else {
  //     print("ima in else");
  //     request.fields['firstname'] = firstName;
  //     request.fields['lastname'] = lastName;
  //     request.fields['cnic'] = cnic;
  //     request.fields['address'] = address;
  //     request.fields['mobileno'] = mobileno;
  //     request.fields['roleid'] = 3.toString();
  //     request.fields['rolename'] = 'resident';
  //     request.fields['password'] = password;
  //     request.fields['vechileno'] = vechileno;
  //     request.fields['subadminid'] = subadminid.toString();
  //     request.fields['propertytype'] = propertyType;
  //     request.fields['residenttype'] = residentalType;
  //     request.fields['committeemember'] ="0";
  //     var responsed = await request.send();
  //     var response = await Http.Response.fromStream(responsed);
  //     print(response.statusCode);
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data);
  //       print(response.body);
  //       Get.snackbar("Resident Register Successfully", "");
  //       // Get.toNamed(homescreen, arguments: user);
  //       Get.offAndToNamed(viewuser, arguments: user);
  //     } else if (response.statusCode == 403) {
  //       var data = jsonDecode(response.body.toString());

  //       Get.snackbar(
  //         "Error",
  //         data.toString(),
  //       );
  //     } else {
  //       Get.snackbar("Failed to Register", "");
  //     }
  //   }
  // }

}
