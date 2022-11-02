import 'dart:convert';

import 'package:get/get.dart';
import 'package:userapp/Module/ReportsHistory/Model/admin_reports_model.dart';

import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import 'package:http/http.dart' as Http;

class AdmoinReportsHistotryController extends GetxController {
  var arguments = Get.arguments;
  late final User user;
  List<AdminReportHistory> li = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    user = arguments;

    print('oninit $user');
  }

  Future<List<AdminReportHistory>> ViewAdminReportsHistoryApi(
      int subadminid, int residentid, String token) async {
    final response = await Http.get(
      Uri.parse(Api.historyreports +
          "/" +
          subadminid.toString() +
          "/" +
          residentid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print('data $data');

      li = (data['data'] as List)
          .map((e) => AdminReportHistory(
              id: e['id'],
              subadminid: e['subadminid'],
              userid: e['userid'],
              title: e['title'],
              description: e['description'],
              date: e['date'],
              status: e['status'],
              statusdescription: e['statusdescription'],
              created_at: e['created_at'],
              updated_at: e['updated_at']))
          .toList();
      return li;
    }

    return li;
  }
}
