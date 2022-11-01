import 'package:get/get.dart';

Future AppShowWarring ({required String body}){
  return Get.defaultDialog(
    title: 'Warning',
    middleText: body,
  );
}
