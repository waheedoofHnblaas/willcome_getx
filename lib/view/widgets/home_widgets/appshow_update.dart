import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/core/constant/colors.dart';

GetSnackBar AppShowUpdate ({required String body}){
  return GetSnackBar(
    backgroundColor: AppColors.primary,
    messageText: Center(
        child: Text(
          body,
          style: TextStyle(color: AppColors.background),
        )),
    duration: const Duration(
      seconds: 2,
    ),
  );
}
