import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/approutes.dart';
import 'package:willcome_getx/core/class/statusrequest.dart';
import 'package:willcome_getx/core/function/handlingdata.dart';
import 'package:willcome_getx/data/datasource/remote/auth/signup.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/appshow_warring.dart';

abstract class RegisterController extends GetxController {
  register();

  toLogin();
}

class RegisterControllerImp extends RegisterController {
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController username;
  late TextEditingController password;
  late GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest = StatusRequest.none;
  final SignUpData signUpData = SignUpData(Get.find());
  late List data = [];

  @override
  register() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print('signup with ${email.text}');

      var response = await signUpData.signUpUser(
        email: email.text,
        password: password.text,
        phone: phone.text,
        username: username.text,
      );
      statusRequest = handlingData(response);
      print('$response------');
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          Get.toNamed(AppRoute.verfiysignup, arguments: {'email': email.text});
        } else {
          AppShowWarring(body: 'user is existed');
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print('not validate');
    }
  }

  @override
  toLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();

    super.dispose();
  }
}
