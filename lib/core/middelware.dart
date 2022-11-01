import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/approutes.dart';
import 'package:willcome_getx/core/services/services.dart';


class MiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  final MyServices _myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    // if (_myServices.sharedPreferences.getString('step') == '1') {
    //   return const RouteSettings(name: '');
    // }
    if (_myServices.sharedPreferences.getString('step') == '2') {
      return  RouteSettings(name: AppRoute.home);
    }else{
      return  RouteSettings(name: AppRoute.login);
    }
     //  return RouteSettings(name: AppRoute.register);
  }
}
