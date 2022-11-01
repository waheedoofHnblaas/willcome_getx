import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/approutes.dart';
import 'package:willcome_getx/core/constant/colors.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apploginbutton.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apploginsubtitle.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/applogintext.dart';

class SuccessSignUpPage extends StatelessWidget {
  const SuccessSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CheckEmailController controller = Get.put(CheckEmailController());
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: Text(
          'Success Sign Up',
          style: Get.theme.textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.done,
              color: Colors.greenAccent,
              size: 100,
            ),
            const AppLoginTitel(title: 'Success Sign Up'),
            const AppLoginSubTitle(
              subtitle: 'You have a new account now\nenter and login by it',
            ),
            const SizedBox(
              height: 60,
            ),
            AppSignUpAndLoginButton(
                text: 'Enter',
                onPressed: () {
                  Get.offNamed(AppRoute.login);
                }),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
