import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as Http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:userapp/Module/Signup/Resident%20Address%20Detail/Model/Apartment.dart';
import 'package:userapp/Module/Signup/Resident%20Address%20Detail/Model/Phase.dart';
import 'package:userapp/Module/Signup/Resident%20Personal%20Detail/Model/Resident.dart';
import 'package:userapp/Services/Shared%20Preferences/MySharedPreferences.dart';

import '../../../../Constants/api_routes.dart';
import '../../../Login/Model/User.dart';
import '../Model/Floor.dart';
import '../Model/Society.dart';
import '../Model/Street.dart';
import '../Model/block.dart';
import '../Model/house.dart';

class ResidentAddressDetailController extends GetxController {
  User? user;
  var token;
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
  TextEditingController houseaddressdetailController = TextEditingController();
  TextEditingController ownerphonenumController = TextEditingController();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  var imageFile;
  String societyorbuildingval = 'society';
  Phase? phasesval;
  Floor? floorsval;
  Apartment? apartmentsval;

  Block? blockval;

  Street? streetval;
  House? houseval;

  Society? societiesname;
  Society? buildingsname;

  String houseorapartment = 'House';
  String rentalorowner = 'Rental';
  var societyli = <Society>[].obs;
  var phaseli = <Phase>[].obs;
  var floorli = <Floor>[].obs;
  var apartmentli = <Apartment>[].obs;

  var blockli = <Block>[].obs;
  var streetli = <Street>[].obs;
  var houseli = <House>[].obs;

  Society? society;
  Phase? phase;
  Floor? floor;
  Apartment? apartment;

  Block? block;
  Street? street;
  House? house;

  var societyorbuildinglist = ['society', 'building'];
  List<Society> societieslist = [];
  List<Society> buildingslist = [];
  List<Phase> phaseslist = [];
  List<Floor> floorslist = [];
  List<Apartment> apartmentslist = [];

  List<Block> blocklist = [];
  List<Street> streetlist = [];

  List<House> houselist = [];

  var houseorapartmentlist = ['House', 'Apartment'];
  var propertytype = 'House';
  var rentalorownerlist = ['Rental', 'Owner'];

  String country = '';
  String state = '';
  String city = '';
  var societyresponsedata;
  var buildingresponsedata;

  var phaseresponsedata;
  var floorsresponsedata;
  var apartmentsresponsedata;

  var blocksresponsedata;
  var streetsresponsedata;
  var housesresponsedata;

  var selectedsocietyid;
  var selectedbuildingid;
  var selectedfloorid;
  var selectedapartmentid;

  var selectedphaseid;
  var getsubadminid;
  var getsocietyname;
  var getbuildingname;
  var getfloorname;
  var getapartmentid;

  var getPhasename;
  var getBlockname;
  var getStreetname;
  var getHouseid;

  var selectedblockid;
  var selectedstreetid;
  var selectedhouseid;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init");
    GetSharedPrefrencesData();

    //viewAllSocietiesApi(id, token);
    //print(user);
  }

  GetSharedPrefrencesData() async {
    user = await MySharedPreferences.getUserData();
    token = user!.bearerToken;

    await viewAllSocietiesApi(societyorbuildingval, token);

    for (var e in societyli) {
      societieslist.add(e);
    }

    //societiesname = societieslist[0];

    print(societieslist);
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

  SocietyOrBuilding(val) async {
    societyli.clear();
    buildingslist.clear();
    societiesname = null;

    buildingsname = null;
    floorli.clear();
    floorslist.clear();
    floorsval = null;
    apartmentli.clear();
    apartmentslist.clear();
    apartmentsval = null;

    societyorbuildingval = val;

    if (societyorbuildingval == 'building') {
      await viewAllBuildingsApi(societyorbuildingval, token);
      for (var e in societyli) {
        buildingslist.add(e);
      }
    } else {
      societiesname = null;

      societieslist.clear();

      await viewAllSocietiesApi(societyorbuildingval, token);

      for (var e in societyli) {
        societieslist.add(e);
      }
    }
    update();
  }

  HouseApartment(val) {
    houseorapartment = val;
    update();
  }

  SelectedSociety(val) async {
    print('dropdown val $val');

    phaseli.clear();
    phaseslist.clear();

    phasesval = null;

    blockli.clear();
    blocklist.clear();
    blockval = null;
    streetli.clear();
    streetlist.clear();
    streetval = null;
    houseli.clear();
    houselist.clear();
    houseval = null;

    selectedsocietyid = val;
    getsocietyname = selectedsocietyid.name;

    
    print(selectedsocietyid.id);

    societiesname = val;
    await viewAllPhasesApi(selectedsocietyid.id, token);

    for (var e in phaseli) {
      phaseslist.add(e);
    }

    //societiesname = societieslist[0];

    print(phaseslist);

    update();
  }

  SelectedBuilding(val) async {
    floorli.clear();
    floorslist.clear();
    floorsval = null;
    apartmentli.clear();
    apartmentslist.clear();
    apartmentsval = null;

    buildingsname = val;

    selectedbuildingid = val;

    getbuildingname = selectedbuildingid.name;

    print(selectedbuildingid.id);

    buildingsname = val;

    await viewAllFloorsApi(selectedbuildingid.id, token);

    for (var e in floorli) {
      floorslist.add(e);
    }

    //societiesname = societieslist[0];

    print(floorslist);

    update();
  }

  SelectedPhase(val) async {
    print('dropdown val $val');
    blockli.clear();
    blocklist.clear();
    blockval = null;
    streetli.clear();
    streetlist.clear();
    streetval = null;
    houseli.clear();
    houselist.clear();
    houseval = null;

    selectedphaseid = val;
    getsubadminid = selectedphaseid.subadminid;
    getPhasename = selectedphaseid.name;

    print(selectedphaseid.id);
    print('get subadmin id ${selectedphaseid.subadminid}');

    print(getsubadminid);

    phasesval = val;

    await viewAllBlocksApi(selectedphaseid.id, token);

    for (var e in blockli) {
      blocklist.add(e);
    }

    //societiesname = societieslist[0];

    print(blocklist);

    update();
  }

  SelectedFloor(val) async {
    print('dropdown val $val');
    apartmentli.clear();
    apartmentslist.clear();
    apartmentsval = null;

    selectedfloorid = val;
    getfloorname = selectedfloorid.name;
    getsubadminid = val.subadminid;

    print(selectedfloorid.id);

    floorsval = val;

    await viewAllApartmentssApi(selectedfloorid.id, token);

    for (var e in apartmentli) {
      apartmentslist.add(e);
    }

    //societiesname = societieslist[0];

    print(floorslist);

    update();
  }

  SelectedApartment(val) {
    getapartmentid = val.id;

    print(getapartmentid);

    apartmentsval = val;
    update();
  }

  SelectedBlock(val) async {
    print('dropdown val $val');

    streetli.clear();
    streetlist.clear();
    streetval = null;
    houseli.clear();
    houselist.clear();
    houseval = null;

    selectedblockid = val;
    getBlockname = selectedblockid.name;

    print(selectedblockid.id);

    blockval = val;

    await viewAllStreetsApi(selectedblockid.id, token);

    for (var e in streetli) {
      streetlist.add(e);
    }

    //societiesname = societieslist[0];

    print(streetlist);

    update();
  }

  SelectedStreet(val) async {
    print('dropdown val $val');
    houseli.clear();
    houselist.clear();
    houseval = null;

    selectedstreetid = val;
    getStreetname = selectedstreetid.name;

    print(selectedstreetid.id);
    streetval = val;

    await viewAllHousesApi(selectedstreetid.id, token);

    for (var e in houseli) {
      houselist.add(e);
    }

    //societiesname = societieslist[0];

    print(streetlist);

    update();
  }

  SelectedHouse(val) {
    houseval = val;
    selectedhouseid = val;
    getHouseid = selectedhouseid.id;

    print(selectedhouseid.id);

    update();
  }

  SelectedRentalOrOwner(val) {
    rentalorowner = val;
    update();
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }

  Future addResidentApi(
      {
      //required File file,
      required int subadminid,
      required int residentid,
      required String country,
      required String state,
      required String city,
      required String societyname,
      required String phasename,
      required String blockname,
      required String streetname,
      required int houseid,
      required String houseaddress,
      required String residentalType,
      required String propertyType,
      required String vechileno,
      required String bearerToken,
      required String ownerName,
      required String ownerPhoneNo}) async {
    print('Add Resident Api  Function Call');

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request =
        Http.MultipartRequest('POST', Uri.parse(Api.registerresident));
    request.headers.addAll(headers);

    //request.files.add(await Http.MultipartFile.fromPath('image', file.path));

    if (residentalType.contains('Rental')) {
      print('iam inside rental');
      request.fields['residentid'] = residentid.toString();
      request.fields['state'] = state;
      request.fields['city'] = city;
      request.fields['societyname'] = societyname;
      request.fields['phasename'] = phasename;
      request.fields['blockname'] = blockname;
      request.fields['streetname'] = streetname;
      request.fields['houseid'] = houseid.toString();
      request.fields['houseaddress'] = houseaddress;

      request.fields['country'] = country;
      request.fields['roleid'] = 3.toString();
      request.fields['rolename'] = 'resident';

      request.fields['vechileno'] = vechileno;
      request.fields['subadminid'] = subadminid.toString();
      request.fields['propertytype'] = propertyType;
      request.fields['residenttype'] = residentalType;
      request.fields['committeemember'] = "0";
      request.fields['status'] = "0";

      request.fields['ownername'] = ownerName;

      request.fields['ownermobileno'] = ownerPhoneNo;
      var responsed = await request.send();
      var response = await Http.Response.fromStream(responsed);

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print(response.body);
        Get.snackbar("Resident Register Successfully", "");
        //Get.offAndToNamed(viewuser, arguments: user);
      } else if (response.statusCode == 403) {
        var data = jsonDecode(response.body.toString());

        Get.snackbar(
          "Error",
          data.toString(),
        );
      } else {
        Get.snackbar("Failed to Register", "");
      }
    } else {
      print("ima in else");
      request.fields['residentid'] = residentid.toString();
      request.fields['state'] = state;
      request.fields['city'] = city;
      request.fields['societyname'] = societyname;
      request.fields['phasename'] = phasename;
      request.fields['blockname'] = blockname;
      request.fields['streetname'] = streetname;
      request.fields['houseid'] = houseid.toString();

      request.fields['country'] = country;
      request.fields['houseaddress'] = houseaddress;

      request.fields['roleid'] = 3.toString();
      request.fields['rolename'] = 'resident';

      request.fields['vechileno'] = vechileno;
      request.fields['subadminid'] = subadminid.toString();
      request.fields['propertytype'] = propertyType;
      request.fields['residenttype'] = residentalType;
      request.fields['committeemember'] = "0";
      request.fields['status'] = "0";

      var responsed = await request.send();
      var response = await Http.Response.fromStream(responsed);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print(response.body);
        Get.snackbar("Resident Register Successfully", "");
        // Get.toNamed(homescreen, arguments: user);
        //Get.offAndToNamed(viewuser, arguments: user);
      } else if (response.statusCode == 403) {
        var data = jsonDecode(response.body.toString());

        Get.snackbar(
          "Error",
          data.toString(),
        );
      } else {
        Get.snackbar("Failed to Register", "");
      }
    }
  }

  Future addBuildingResidentApi(
      {
      //required File file,
      required int subadminid,
      required int residentid,
      required String country,
      required String state,
      required String city,
      required String buildingname,
      required String floorname,
      required int apartmentid,
      required String houseaddress,
      required String residentalType,
      required String propertyType,
      required String vechileno,
      required String bearerToken,
      required String ownerName,
      required String ownerPhoneNo}) async {
    print('Add Resident Api  Function Call');

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request =
        Http.MultipartRequest('POST', Uri.parse(Api.registerbuildingresident));
    request.headers.addAll(headers);

    //request.files.add(await Http.MultipartFile.fromPath('image', file.path));

    if (residentalType.contains('Rental')) {
      print('iam inside rental');
      request.fields['residentid'] = residentid.toString();
      request.fields['state'] = state;
      request.fields['city'] = city;
      request.fields['buildingname'] = buildingname;
      request.fields['floorname'] = floorname;
      request.fields['apartmentid'] = apartmentid.toString();

      request.fields['houseaddress'] = houseaddress;

      request.fields['country'] = country;
      request.fields['roleid'] = 3.toString();
      request.fields['rolename'] = 'resident';

      request.fields['vechileno'] = vechileno;
      request.fields['subadminid'] = subadminid.toString();
      request.fields['propertytype'] = propertyType;
      request.fields['residenttype'] = residentalType;
      request.fields['committeemember'] = "0";
      request.fields['status'] = "0";

      request.fields['ownername'] = ownerName;

      request.fields['ownermobileno'] = ownerPhoneNo;
      var responsed = await request.send();
      var response = await Http.Response.fromStream(responsed);

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print(response.body);
        Get.snackbar("Resident Register Successfully", "");
        //Get.offAndToNamed(viewuser, arguments: user);
      } else if (response.statusCode == 403) {
        var data = jsonDecode(response.body.toString());

        Get.snackbar(
          "Error",
          data.toString(),
        );
      } else {
        Get.snackbar("Failed to Register", "");
      }
    } else {
      print("ima in else");
      request.fields['residentid'] = residentid.toString();
      request.fields['state'] = state;
      request.fields['city'] = city;
      request.fields['buildingname'] = buildingname;
      request.fields['floorname'] = floorname;
      request.fields['apartmentid'] = apartmentid.toString();

      request.fields['country'] = country;
      request.fields['houseaddress'] = houseaddress;

      request.fields['roleid'] = 3.toString();
      request.fields['rolename'] = 'resident';

      request.fields['vechileno'] = vechileno;
      request.fields['subadminid'] = subadminid.toString();
      request.fields['propertytype'] = propertyType;
      request.fields['residenttype'] = residentalType;
      request.fields['committeemember'] = "0";
      request.fields['status'] = "0";

      var responsed = await request.send();
      var response = await Http.Response.fromStream(responsed);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print(response.body);
        Get.snackbar("Resident Register Successfully", "");
        // Get.toNamed(homescreen, arguments: user);
        //Get.offAndToNamed(viewuser, arguments: user);
      } else if (response.statusCode == 403) {
        var data = jsonDecode(response.body.toString());

        Get.snackbar(
          "Error",
          data.toString(),
        );
      } else {
        Get.snackbar("Failed to Register", "");
      }
    }
  }

  Future viewAllSocietiesApi(String type, String token) async {
    print('idhr aya');
    print(token);
    print(type);
    societyli.clear();

    final response = await Http.get(
      Uri.parse(Api.view_all_societies + '/' + type.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.statusCode);

    var data = jsonDecode(response.body.toString());
    societyresponsedata = data['data'];

    if (response.statusCode == 200) {
      for (var e in societyresponsedata) {
        society = Society(
          id: e['id'],
          name: e['name'],
          address: e['address'],
          country: e['country'],
          state: e['state'],
          city: e['city'],
          type: e['type'],
        );

        societyli.add(society!);
      }
      print('society societyli $societyli');
      print('society societyli ${societyli.length}');

      update();

      return societyli;
// societyli.add(society);

    } else {
// return societyli;
    }
  }

  Future viewAllBuildingsApi(String type, String token) async {
    print('idhr aya');
    print(token);
    print(type);
    societyli.clear();

    final response = await Http.get(
      Uri.parse(Api.view_all_societies + '/' + type.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.statusCode);

    var data = jsonDecode(response.body.toString());
    buildingresponsedata = data['data'];

    if (response.statusCode == 200) {
      for (var e in buildingresponsedata) {
        society = Society(
          id: e['id'],
          name: e['name'],
          address: e['address'],
          country: e['country'],
          state: e['state'],
          city: e['city'],
          type: e['type'],
        );

        societyli.add(society!);
      }
      print('societyli $societyli');
      print('societyli ${societyli.length}');

      update();

      return societyli;
// societyli.add(society);

    } else {
// return societyli;
    }
  }

  Future viewAllPhasesApi(societyid, String token) async {
    print('phase aya');
    print(token);
    print(societyid);

    final response = await Http.get(
      Uri.parse(Api.view_all_phases + '/' + societyid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());
    phaseresponsedata = data['data'];
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      for (var e in phaseresponsedata) {
        phase = Phase(
          id: e['id'],
          name: e['name'],
          subadminid: e['subadminid'],
          societyid: e['societyid'],
        );

        phaseli.add(phase!);
      }

      update();

      return phaseli;
// societyli.add(society);

    } else {
// return societyli;
    }
  }

  Future viewAllFloorsApi(buildingid, String token) async {
    print('phase aya');
    print(token);
    print(buildingid);

    final response = await Http.get(
      Uri.parse(Api.view_all_floors + '/' + buildingid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());
    floorsresponsedata = data['data'];
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      for (var e in floorsresponsedata) {
        floor = Floor(
          id: e['id'],
          name: e['name'],
          subadminid: e['subadminid'],
          buildingid: e['buildingid'],
        );

        floorli.add(floor!);
      }

      update();

      return floorli;
// societyli.add(society);

    } else {
// return societyli;
    }
  }

  Future viewAllBlocksApi(phaseid, String token) async {
    print('Block aya');
    print(token);
    print(phaseid);

    final response = await Http.get(
      Uri.parse(Api.view_all_blocks + '/' + phaseid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());
    blocksresponsedata = data['data'];
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      for (var e in blocksresponsedata) {
        block = Block(
          id: e['id'],
          name: e['name'],
          pid: e['pid'],
        );

        blockli.add(block!);
      }

      update();

      return blockli;
// societyli.add(society);

    } else {
// return societyli;
    }
  }

  Future viewAllStreetsApi(blockid, String token) async {
    print('Block aya');
    print(token);
    print(blockid);

    final response = await Http.get(
      Uri.parse(Api.view_all_streets + '/' + blockid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());
    streetsresponsedata = data['data'];
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      for (var e in streetsresponsedata) {
        street = Street(
          id: e['id'],
          name: e['name'],
          bid: e['bid'],
        );

        streetli.add(street!);
      }

      update();

      return streetli;
// societyli.add(society);

    } else {
// return societyli;
    }
  }

  Future viewAllHousesApi(streetid, String token) async {
    print('Block aya');
    print(token);
    print(streetid);

    final response = await Http.get(
      Uri.parse(Api.view_all_houses + '/' + streetid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());
    housesresponsedata = data['data'];
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      for (var e in housesresponsedata) {
        house = House(
          id: e['id'],
          address: e['address'],
          sid: e['sid'],
        );

        houseli.add(house!);
      }

      update();

      return houseli;
// societyli.add(society);

    } else {
// return societyli;
    }
  }

  Future viewAllApartmentssApi(floorid, String token) async {
    print('Apartment aya');
    print(token);
    print(floorid);

    final response = await Http.get(
      Uri.parse(Api.view_all_apartments + '/' + floorid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());
    apartmentsresponsedata = data['data'];
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      for (var e in apartmentsresponsedata) {
        apartment = Apartment(
          id: e['id'],
          name: e['name'],
          fid: e['fid'],
        );

        apartmentli.add(apartment!);
      }

      update();

      return apartmentli;
// societyli.add(society);

    } else {
// return societyli;
    }
  }
}
