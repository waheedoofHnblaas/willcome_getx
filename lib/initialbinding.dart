import 'package:get/get.dart';
import 'package:willcome_getx/core/class/crud.dart';
import 'package:willcome_getx/controllers/auth_controllers/register_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(RegisterControllerImp());
    Get.put(GetMaterialController(),permanent: true);
  }
}
