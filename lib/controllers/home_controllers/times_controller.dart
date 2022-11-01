import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/approutes.dart';
import 'package:willcome_getx/core/class/statusrequest.dart';
import 'package:willcome_getx/core/constant/colors.dart';
import 'package:willcome_getx/core/function/handlingdata.dart';
import 'package:willcome_getx/core/services/services.dart';
import 'package:willcome_getx/data/datasource/remote/home/homeData.dart';
import 'package:willcome_getx/data/model/timemodel.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/appshow_warring.dart';
import 'package:willcome_getx/view/widgets/home_widgets/appshow_update.dart';

abstract class TimesController extends GetxController {
  Future<List<TimeModel>> getTimes();

  toTimeData(TimeModel timeId);

  String getMyId();

  String getMyName();
  String getMyNum();
}

class TimesControllerImp extends TimesController {
  final MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.none;
  final HomeData homeData = HomeData(Get.find());
  List<TimeModel> timesList = [];

  @override
  Future<List<TimeModel>> getTimes() async {
    String id = getMyId();
    statusRequest = StatusRequest.loading;
    update();
    print('getHomeData');
    timesList.clear();
    var response = await homeData.homeData(id);
    statusRequest = handlingData(response);

    print('=====response======${response}=======');
    if (statusRequest == StatusRequest.success) {
      final body = json.encode(response); //map to json
      Map map = json.decode(body);
      print('=====map======${map['times']}=======');

      List times = map['times'];
      if (times.isNotEmpty) {
        for (var element in times) {
          timesList.add(TimeModel.fromJson(element));
        }
      } else {
        AppShowWarring(body: 'no data available');
        statusRequest = StatusRequest.failure;
      }
    }
    Get.showSnackbar(
      AppShowUpdate(body: 'done update'),
    );
    update();
    return timesList;
  }

  @override
  void onInit() async {
    super.onInit();
    await getTimes();
  }

  @override
  String getMyId() => myServices.sharedPreferences.getString('id')!;

  @override
  String getMyName() => myServices.sharedPreferences.getString('name')!;
  @override
  String getMyNum() => myServices.sharedPreferences.getString('phone')!;

  @override
  toTimeData(TimeModel time) {
    Get.toNamed(AppRoute.timedata, arguments: jsonEncode(time),);
  }
}
