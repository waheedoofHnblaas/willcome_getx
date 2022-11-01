import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/controllers/auth_controllers/login_controller.dart';
import 'package:willcome_getx/core/class/statusrequest.dart';
import 'package:willcome_getx/core/constant/colors.dart';
import 'package:willcome_getx/core/function/validinput.dart';
import 'package:willcome_getx/view/widgets/app_appbar.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apploginbutton.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apploginsignup.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/applogintext.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apptextfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp(), permanent: true);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(title: 'Login'),
      body: GetBuilder<LoginControllerImp>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Form(
              key: controller.formState,
              child: ListView(
                children: [
                  const AppLoginTitel(title: 'Inter\n Your Account Data\n Her'),
                  AppTextField(
                    type: 'email',
                    iconData: Icons.email,
                    inputType: TextInputType.emailAddress,
                    onChanged: (val) {},
                    validator: (val) {
                      controller.email = TextEditingController(text: val);
                      return validInput(val!, 15, 60, 'email');
                    },
                    textFieldController: controller.email,
                  ),
                  // AppTextField(
                  //   type: 'phone',
                  //   iconData: Icons.phone,
                  //   inputType: TextInputType.number,
                  //   onChanged: (val) {
                  //   },
                  //   validator: (val) {},
                  //   textFieldController: TextEditingController(),
                  // ),
                  AppTextField(
                    type: 'password',
                    iconData: Icons.password,
                    obscureText: true,
                    inputType: TextInputType.visiblePassword,
                    onChanged: (val) {},
                    validator: (val) {
                      controller.password = TextEditingController(text: val);
                      return validInput(val!, 8, 30, 'password');
                    },
                    textFieldController: controller.password,
                  ),
                  AppSignUpAndLoginButton(
                    text: 'Login',
                    onPressed: () async {
                      await controller.login();
                    },
                  ),
                  AppLoginSignUp(
                    textone: 'you don\'t have account ?',
                    texttwo: 'register',
                    onPressed: () {
                      controller.toRegister();
                    },
                  )
                ],
              ));
        }
      }),
    );
  }
}
