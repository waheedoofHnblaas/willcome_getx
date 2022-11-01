import 'dart:convert';

import 'package:get/get.dart';
import 'package:willcome_getx/core/class/statusrequest.dart';
import 'package:willcome_getx/core/function/handlingdata.dart';
import 'package:willcome_getx/core/services/services.dart';
import 'package:willcome_getx/data/datasource/remote/home/homeData.dart';
import 'package:willcome_getx/data/datasource/remote/home/timedata.dart';
import 'package:willcome_getx/data/model/timemodel.dart';
import 'package:willcome_getx/data/model/usersModeModel.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/appshow_warring.dart';
import 'package:willcome_getx/view/widgets/home_widgets/appshow_update.dart';

abstract class UsersTimesController extends GetxController {
  Future<List<UserModeModel>> getTimeData(String timeId);
}
class UsersTimesControllerImp extends UsersTimesController {
  final MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.none;
  final TimeData userTimeData = TimeData(Get.find());
  List<UserModeModel> userList = [];

  @override
  Future<List<UserModeModel>> getTimeData(String timeId) async {

    statusRequest = StatusRequest.loading;
    update();
    print('timeData');
    userList.clear();
    var response = await userTimeData.timeData(timeId);
    statusRequest = handlingData(response);

    print('=====response======${response}=======');
    if (statusRequest == StatusRequest.success) {
      final body = json.encode(response); //map to json
      Map map = json.decode(body);
      print('=====map======${map['users']}=======');

      List users = map['users'];
      if (users.isNotEmpty) {
        for (var element in users) {
          userList.add(UserModeModel.fromJson(element));
          print("$users   ======================");
        }
      } else {
        AppShowWarring(body: 'users not found');
        statusRequest = StatusRequest.failure;
      }
    }
    Get.showSnackbar(
      AppShowUpdate(body: 'number of Guest is ${userList.length}'),
    );
    update();
    return userList;
  }
  TimeModel? timeModel;
  @override
  void onInit() {
    timeModel = TimeModel.fromJson(jsonDecode(Get.arguments));
    getTimeData(timeModel!.timesId!);
  }



}