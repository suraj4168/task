import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../database_service/database.dart';
import '../routes/app_route.dart';
import '../widgets/utility.dart';

class LoginScreenController extends GetxController {
  var emailTextController = TextEditingController().obs;
  var passwordTextController = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();

  login() async {
    if (formKey.currentState!.validate()) {
      await DatabaseService.instance
          .getLoginUser(
              emailTextController.value.text, passwordTextController.value.text)
          .then((userData) {
        if (userData != null) {
          GetStorage().write("token", userData.email);
          GetStorage().write("email",  userData.email);
          GetStorage().write("username",  userData.user_name);
          GetStorage().write("password",  userData.password);
          Get.offAllNamed(Routes.home);
        } else {
          Utility.showToast(message: "Something went wrong!");
        }
      }).catchError((error) {
        print(error);
      });
    }
  }
}
