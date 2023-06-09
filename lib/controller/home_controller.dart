import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../database_service/database.dart';
import '../model/user_model.dart';
import '../routes/app_route.dart';
import '../widgets/utility.dart';

class HomeScreenController extends GetxController {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var emailTextController = TextEditingController().obs;
  var passwordTextController = TextEditingController().obs;
  var nameTextController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  Future<void> getUserData() async {
    emailTextController.value.text = GetStorage().read('email');
    nameTextController.value.text = GetStorage().read('username');
    passwordTextController.value.text = GetStorage().read('password');
  }


  updateUser() async {
    if (formKey.currentState!.validate()) {
      UserModel user = UserModel(nameTextController.value.text,
          emailTextController.value.text, passwordTextController.value.text);
      await DatabaseService.instance.updateUser(user).then((value) {
        if (value == 1) {
          GetStorage().erase();
          Get.offAllNamed(Routes.login);
          Utility.showToast(message: "Updated Successfully! Please log In again.");
        } else {
        }
      }).catchError((error) {
        print(error);
      });
    }
  }
}