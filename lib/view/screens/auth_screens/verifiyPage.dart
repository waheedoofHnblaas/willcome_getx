import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:willcome_getx/approutes.dart';
import 'package:willcome_getx/controllers/auth_controllers/verify_controller.dart';
import 'package:willcome_getx/core/class/statusrequest.dart';
import 'package:willcome_getx/core/constant/colors.dart';
import 'package:willcome_getx/core/constant/imagesassets.dart';
import 'package:willcome_getx/view/widgets/app_appbar.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apploginbutton.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apploginsignup.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apploginsubtitle.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/applogintext.dart';

class VerificationSignUpPage extends StatelessWidget {
  const VerificationSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifiyCodeSignUpController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(title: 'Verification code'),
      body: GetBuilder<VerifiyCodeSignUpController>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AppLoginSubTitle(
                  subtitle: 'Enter code that you receive\nin your account',
                ),
                const SizedBox(
                  height: 33,
                ),
                SizedBox(
                  height: 100,
                  child: OtpTextField(
                    focusedBorderColor: Get.theme.primaryColor,
                    fieldWidth: 50,
                    margin: const EdgeInsets.all(8),
                    numberOfFields: 5,
                    borderRadius: BorderRadius.circular(10),
                    borderColor: Get.theme.primaryColor,

                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      controller.code =
                          TextEditingController(text: verificationCode);
                      controller.checSignUpkCode();
                    }, // end onSubmit
                  ),
                ),
                AppSignUpAndLoginButton(
                    text: 'Check Code',
                    onPressed: () {
                      controller.checSignUpkCode();
                    }),
                const SizedBox(
                  height: 10,
                ),
                AppLoginSignUp(
                  textone: 'Don\'t have account ? ',
                  texttwo: 'Sign up',
                  onPressed: () {
                    Get.offNamed(AppRoute.register);
                  },
                )
              ],
            ),
          ));
        }
      }),
    );
  }
}
