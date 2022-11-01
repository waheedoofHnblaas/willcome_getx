import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/approutes.dart';
import 'package:willcome_getx/core/class/statusrequest.dart';
import 'package:willcome_getx/core/function/handlingdata.dart';
import 'package:willcome_getx/core/services/services.dart';
import 'package:willcome_getx/data/datasource/remote/auth/login.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/appshow_warring.dart';

abstract class LoginController extends GetxController {
  login();

  toRegister();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> formState = GlobalKey<FormState>();
  late bool showText = true;
  StatusRequest? statusRequest = StatusRequest.none;
  final LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print('login with ${email.text} and ${password.text}');

      var response = await loginData.loginData(
        email: email.text,
        password: password.text,
      );
      statusRequest = handlingData(response);
      print('$response------');
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          myServices.sharedPreferences
              .setString('id', response['data']['users_id']);
          myServices.sharedPreferences
              .setString('name', response['data']['users_name']);
          myServices.sharedPreferences
              .setString('email', response['data']['users_email']);
          myServices.sharedPreferences
              .setString('phone', response['data']['users_phone']);
          myServices.sharedPreferences
              .setString('createDate', response['data']['users_create']);
          myServices.sharedPreferences.setString('step', '2');
          Get.offAllNamed(AppRoute.home);
        } else {
          AppShowWarring(body: 'email or password is wrong');
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      print('validate');
    } else {
      print('not validate');
    }
  }

  @override
  toRegister() {
    Get.offNamed(AppRoute.register);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
