import 'dart:convert';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';

import '../../../Routes/set_routes.dart';
import '../../Login/Model/User.dart';
import '../Model/Event.dart';

class EventScreenController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  var user = Get.arguments;
  late final User userdata;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata = user;
    print(userdata);
  }

  Future<Event> viewEventsApi(
      {required int userid, required String token}) async {
    print("${userid.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.viewevent + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    ;

    if (response.statusCode == 200) {
      return Event.fromJson(data);
    }

    return Event.fromJson(data);
  }
}
