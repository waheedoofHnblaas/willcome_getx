import 'package:get/get.dart';
import 'package:willcome_getx/approutes.dart';
import 'package:willcome_getx/core/middelware.dart';
import 'package:willcome_getx/view/screens/auth_screens/login.dart';
import 'package:willcome_getx/view/screens/auth_screens/register.dart';
import 'package:willcome_getx/view/screens/auth_screens/success_register.dart';
import 'package:willcome_getx/view/screens/auth_screens/verifiyPage.dart';
import 'package:willcome_getx/view/screens/home_screens/home.dart';
import 'package:willcome_getx/view/screens/home_screens/timeData.dart';
import 'core/constant/approutes.dart';
import 'view/screens/times_process_screens/add_time.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //   name: AppRoute.language,
  //   page: () => const TestView(),
  // ),
  GetPage(
    name: AppRoute.register,
    page: () => const RegisterPage(),
    middlewares: [
      MiddleWare(),
    ],
  ),
  GetPage(
    name: AppRoute.login,
    page: () => const LoginPage(),
  ),
  GetPage(
    name: AppRoute.verfiysignup,
    page: () => const VerificationSignUpPage(),
  ),
  GetPage(name: AppRoute.successSignup, page: () => const SuccessSignUpPage()),
  GetPage(name: AppRoute.home, page: () => const HomePage()),
  GetPage(name: AppRoute.addtime, page: () => const AddTimePage()),
  GetPage(name: AppRoute.timedata, page: () =>  TimeDataPage(),),
];
