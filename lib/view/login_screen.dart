import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/login_controller.dart';
import 'package:task/helpers/text_styles.dart';

import '../routes/app_route.dart';
import '../widgets/utility.dart';

class LoginScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginScreenController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0432A3),
        body:   SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
              ),
              Image.asset(
                "assets/images/logo.png",
                height: 150.0,
                width: 150.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 20, bottom: 0, left: 10, right: 10),
                child: Form(
                  key: loginController.formKey,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17.0))
                        .copyWith(color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "Login",
                            textScaleFactor: 1.8,
                          ),
                        ),
                        /// Email and Password Fields
                  Obx(
                        () => Padding(
                          padding: EdgeInsets.only(
                              left: 12, right: 12, bottom: 10),
                          child: TextFormField(
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            controller: loginController.emailTextController.value,
                            textAlignVertical: TextAlignVertical.center,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                if (!GetUtils.isEmail(value)) {
                                  return "Please enter your Email in a valid format";
                                } else {
                                  return null;
                                }
                              } else {
                                return "Please enter your email.";
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20),
                              border: OutlineInputBorder(
                                borderSide:  BorderSide(
                                  width: 2,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              hintText: 'Email ',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Color(0xff0432A3),
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                  ),
                  Obx(
                        () =>   Padding(
                          padding: EdgeInsets.only(
                              left: 12, right: 12, bottom: 10),
                          child:  TextFormField(
                              obscureText:
                              true,
                              maxLines: 1,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.visiblePassword,
                              controller: loginController.passwordTextController.value,
                              textAlignVertical: TextAlignVertical.center,
                            validator: (password) {
                              if (password!.isEmpty) {
                                return "Please enter your password.";
                              }
                            },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    border: OutlineInputBorder(
                                      borderSide:  BorderSide(
                                        width: 2,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    hintText: "Password",
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Icon(
                                        FontAwesomeIcons.lock,
                                        color: Color(0xff0432A3),
                                        size: 30,
                                      ),
                                    ),
                                  ),
                            ),

                        ),
                  ),

                        Utility.getButton(
                          width: double.infinity,
                          context,
                          "Login",
                              () async {
                                loginController.login();
                              },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "Don't have an account",
                            style: AppTextStyle.textStyle(Colors.black,20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.register);
                            },
                            child: Text(
                              "Create a Account",
                              style: AppTextStyle.textStyle(Color(0xff0432A3),18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
