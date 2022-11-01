import 'package:get/get.dart';
import 'package:willcome_getx/approutes.dart';
import 'package:willcome_getx/controllers/auth_controllers/login_controller.dart';
import 'package:willcome_getx/core/services/services.dart';

abstract class LogoutController extends GetxController {
  logout();
}

class LogoutControllerImp extends LogoutController {
  final MyServices _myServices = Get.find();

  @override
  logout() async{
  await  _myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
