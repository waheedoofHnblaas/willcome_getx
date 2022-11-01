import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/controllers/auth_controllers/register_controller.dart';
import 'package:willcome_getx/core/class/statusrequest.dart';
import 'package:willcome_getx/core/constant/colors.dart';
import 'package:willcome_getx/core/function/validinput.dart';
import 'package:willcome_getx/view/widgets/app_appbar.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apploginbutton.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apploginsignup.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/applogintext.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apptextfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterControllerImp registerControllerImp = Get.find();

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppAppBar(title: 'Register'),
      body: GetBuilder<RegisterControllerImp>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Form(
            key: controller.formState,
            child: ListView(
              children: [
                const AppLoginTitel(title: 'Inter\n Your Account Data\n Her'),
                AppTextField(
                  type: 'name',
                  iconData: Icons.person,
                  inputType: TextInputType.name,
                  onChanged: (val) {
                    //  controller.username = TextEditingController(text: val);
                  },
                  validator: (val) {
                    controller.username = TextEditingController(text: val);
                    return validInput(val!, 6, 18, 'username');
                  },
                  textFieldController: controller.username,
                ),
                AppTextField(
                  type: 'email',
                  iconData: Icons.email,
                  inputType: TextInputType.emailAddress,
                  onChanged: (val) {
                    // controller.email = TextEditingController(text: val);
                  },
                  validator: (val) {
                    controller.email = TextEditingController(text: val);
                    return validInput(val!, 10, 60, 'email');
                  },
                  textFieldController: controller.email,
                ),
                AppTextField(
                  type: 'phone',
                  iconData: Icons.phone,
                  inputType: TextInputType.number,
                  onChanged: (val) {
                    //  controller.phone = TextEditingController(text: val);
                  },
                  validator: (val) {
                    controller.phone = TextEditingController(text: val);
                    return validInput(val!, 10, 16, 'phone');
                  },
                  textFieldController: controller.phone,
                ),
                AppTextField(
                  type: 'password',
                  iconData: Icons.password,
                  obscureText: true,
                  inputType: TextInputType.visiblePassword,
                  onChanged: (val) {
                    //  controller.password = TextEditingController(text: val);
                  },
                  validator: (val) {
                    controller.password = TextEditingController(text: val);
                    return validInput(val!, 8, 60, 'password');
                  },
                  textFieldController: controller.password,
                ),
                AppSignUpAndLoginButton(
                  text: 'Register',
                  onPressed: () async {
                    await controller.register();
                  },
                ),
                AppLoginSignUp(
                  textone: 'you have account ?',
                  texttwo: 'login',
                  onPressed: () {
                    controller.toLogin();
                  },
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
