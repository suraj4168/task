import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task/database_service/database.dart';
import '../model/user_model.dart';
import '../routes/app_route.dart';

class RegisterScreenController extends GetxController {
  final formKeyRegister = GlobalKey<FormState>();

  var emailTextController = TextEditingController().obs;
  var passwordTextController = TextEditingController().obs;
  var nameTextController = TextEditingController().obs;


  signUp() async {
    if (formKeyRegister.currentState!.validate()) {
      UserModel uModel = UserModel(nameTextController.value.text,
          emailTextController.value.text, passwordTextController.value.text);
      await DatabaseService.instance
          .saveData(uModel).then((userData) {
        GetStorage().write("token", emailTextController.value.text);
        GetStorage().write("email",  emailTextController.value.text);
        GetStorage().write("username",nameTextController.value.text);
        GetStorage().write("password", passwordTextController.value.text);
        Get.offAllNamed(Routes.home);
      }).catchError((error) {
        print(error);
      });
    }
  }
}
