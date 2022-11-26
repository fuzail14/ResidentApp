import 'dart:convert';

import 'package:get/get.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import 'package:http/http.dart' as Http;

import '../Model/PreApproveEntry.dart';

class PreApproveEntryController extends GetxController
{
  late final User userdata;
  var user = Get.arguments;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata=user;

  }




  viewPreApproveEntryReportsApi(int userid, String token) async {
    print("token $token");

    final response = await Http.get(
      Uri.parse(Api.viewpreapproveentryreports + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.statusCode);
    var data = jsonDecode(response.body.toString());
    

    if (response.statusCode == 200) {
      return PreApproveEntry.fromJson(data);
    }
    return PreApproveEntry.fromJson(data);
    ;
  }








}