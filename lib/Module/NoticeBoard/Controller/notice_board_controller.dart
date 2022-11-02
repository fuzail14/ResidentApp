import 'dart:convert';

import 'package:get/get.dart';

import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';

import 'package:http/http.dart' as Http;

import '../Model/notice_board_model.dart';

class NoticeBoardController extends GetxController {
  var user = Get.arguments;

  late final User userdata;

  List<NoticeBoardModel> li = [];
  var currentNoticeBoardId;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init");
    userdata = this.user;
  }

  Future<List<NoticeBoardModel>> viewNoticeBoardApi(
      int subadminid, String token) async {
    

    final response = await Http.get(
      Uri.parse(Api.viewallnoticesapi + "/" + subadminid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      

      li = (data["data"] as List)
          .map((e) => NoticeBoardModel(
                id: e['id'],
                noticetitle: e['noticetitle'],
                noticedetail: e['noticedetail'],
                startdate: e['startdate'],
                enddate: e['enddate'],
                starttime: e['starttime'],
                endtime: e['endtime'],
                status: e['status'],
                subadminid: e['subadminid'],
              ))
          .toList();

      return li;
      
    }
    return li;
  }


}
