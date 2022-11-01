import 'package:flutter/material.dart';
import 'package:willcome_getx/core/constant/colors.dart';

AppAppBar({required title, Widget? iconButton, Widget? personalData}) {
  return AppBar(
    foregroundColor: AppColors.primary,
    backgroundColor: AppColors.appBarBackground,
    leading: iconButton ?? Container(),
    //primary: false,
    actions: [
      personalData ?? Container(),
    ],
    elevation: 0,
    centerTitle: true,
    title: Text(title),
  );
}
