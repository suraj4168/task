import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task/controller/home_controller.dart';

import '../helpers/text_styles.dart';
import '../routes/app_route.dart';
import '../widgets/utility.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Welcome to profile",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 0, left: 10, right: 10),
                child: Form(
                  key: homeController.formKey,
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
                            "Update Profile",
                            textScaleFactor: 1.8,
                          ),
                        ),
                        Obx(
                          () => Padding(
                            padding: EdgeInsets.only(
                                left: 12, right: 12, bottom: 10),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLines: 1,
                              keyboardType: TextInputType.emailAddress,
                              controller:
                                  homeController.nameTextController.value,
                              textAlignVertical: TextAlignVertical.center,
                              validator: (username) {
                                if (username!.isEmpty) {
                                  return "Please enter your username.";
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                hintText: 'Username ',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Icon(
                                    Icons.supervised_user_circle_sharp,
                                    color: Color(0xff0432A3),
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Padding(
                            padding: EdgeInsets.only(
                                left: 12, right: 12, bottom: 10),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLines: 1,
                              keyboardType: TextInputType.emailAddress,
                              controller:
                                  homeController.emailTextController.value,
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
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
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
                          () => Padding(
                            padding: EdgeInsets.only(
                                left: 12, right: 12, bottom: 10),
                            child: TextFormField(
                              obscureText: true,
                              maxLines: 1,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.visiblePassword,
                              controller:
                                  homeController.passwordTextController.value,
                              textAlignVertical: TextAlignVertical.center,
                              validator: (password) {
                                if (password!.isEmpty) {
                                  return "Please enter your password.";
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
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
                          "Update",
                              () async {
                                homeController.updateUser();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Utility.getButton(
              width: double.infinity,
              context,
              "Logout",
                  () async {
                    GetStorage().erase();
                    Get.offAllNamed(Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
