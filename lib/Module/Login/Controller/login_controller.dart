import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../../../Constants/api_routes.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../Model/User.dart';

class LoginController extends GetxController {
  var isHidden = false;

  TextEditingController userCnicController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  Future loginApi(String cnic, String password) async {
    print("Login Api  Functions Hits ! ");

    print("=========");
    print(cnic);
    print(password);
    print("=========");
    try {
      final response = await Http.post(
        Uri.parse(Api.login),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'cnic': cnic,
          'password': password,
        }),
      );
      print("Login Api Hits Successfully !");
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['data']['roleid'] == 3) {
        print(data);
        print(data['data']['firstname']);
        print(data['data']['residentid']);
        final User user = User(
            userid: data['data']['residentid'],
            subadminid: data['data']['subadminid'],
            firstName: data['data']['firstname'],
            lastName: data['data']['lastname'],
            cnic: data['data']['cnic'],
            roleId: data['data']['roleid'],
            roleName: data['data']['rolename'],
            bearerToken: data['Bearer']);
        MySharedPreferences.setUserData(user: user);
        print(user.userid);

        print(response.statusCode);
        print(response.statusCode);
        Get.offAndToNamed(homescreen, arguments: user);
        Get.snackbar(
          "Login Successfully",
          "Welcome 😉 " +
              user.firstName.toString() +
              " " +
              user.lastName.toString(),
          backgroundColor: Colors.white,
        );
      } else if (response.statusCode == 200 && data['data']['roleid'] != 3) {
        Get.snackbar(
          "Login Failed",
          'You are not Register to our System. Contact Admin !',
          backgroundColor: Colors.white,
        );
      } else if (response.statusCode == 401) {
        var data = jsonDecode(response.body.toString());

        print(data['data']);
        Get.snackbar('Unauthorized', 'Invalid Cnic or Password');
      } else if (response.statusCode == 403) {
        var data = jsonDecode(response.body.toString());

        if ((data['errors'] as List).contains('The cnic field is required.')) {
          Get.snackbar('Error Message', 'Cnic Required');
        } else if ((data['errors'] as List)
            .contains('The password field is required.')) {
          Get.snackbar('Error Message', 'Password Required');
        }
      }
    } catch (SocketException) {
      Get.snackbar('Error Message', 'No Internet Connection');
    }

  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }
}
