import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/login_controller.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return 
      SafeArea(
        child: Scaffold(
    
        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Welcome to Mia Resident App'),
                          Container(
                              child: Image(
                            image: AssetImage('assets/loginlogo.png'),
                          )),
                          SizedBox(
                            height: 20
                          ),

                          MyTextFormField(controller: controller.userCnicController
                              ,padding: EdgeInsets.all(8),
                              keyboardType: TextInputType.number,
                              validator: emptyStringValidator,
                              hintText: 'Enter Cnic',
                              labelText: 'Cnic',
                              onFocusedBorderColor: primaryColor,
                              onEnabledBorderColor: primaryColor),

                          SizedBox(
                            height: 20,
                          ),
                         MyPasswordTextFormField(padding: EdgeInsets.all(8),
                           controller: controller.userPasswordController,
                           validator: emptyStringValidator,
                           labelText: 'Password',
                           hintText: 'Enter Password',
                           hintTextColor: primaryColor,
                           togglePasswordView: controller.togglePasswordView,
                             onFocusedBorderColor: primaryColor,
                             onEnabledBorderColor: primaryColor,
                             obscureText: controller.isHidden),
                          SizedBox(
                            height: 20,
                          ),
                     MyButton(width: MediaQuery.of(context).size.width,
                       horizontalPadding: 8, verticalPadding: 8, child: Text('Login'),
                      onPressed: ()

                       {
                         if (_formKey.currentState!.validate()) {


                           controller.loginApi(
                               controller.userCnicController.text,
                               controller.userPasswordController.text);

                         }


                       },)


                        ]),
                  ),
                ),
              );
            }),
    ),
      );
  }
}
