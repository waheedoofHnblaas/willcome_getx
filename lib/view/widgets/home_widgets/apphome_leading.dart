import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/controllers/auth_controllers/logout_controller.dart';
import 'package:willcome_getx/controllers/home_controllers/times_controller.dart';
import 'package:willcome_getx/view/widgets/home_widgets/rowtile.dart';

class AppHomeLeading extends StatelessWidget {
  const AppHomeLeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.bottomSheet(GetBuilder<LogoutControllerImp>(builder: (controller) {
          return Container(
            height: Get.height / 3,
            color: Get.theme.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RowTileWidget(
                  icon: const Icon(Icons.logout),
                  text: const Text('logout'),
                  onTap: () async {
                    await controller.logout();
                  },
                ),
                GetBuilder<TimesControllerImp>(builder: (controllerTimes) {
                  return RowTileWidget(
                    icon: const Icon(Icons.refresh),
                    text: const Text('refresh'),
                    onTap: () async {
                      await controllerTimes.getTimes();
                    },
                  );
                }),
              ],
            ),
          );
        }));
      },
      icon: const Icon(Icons.menu),
    );
  }
}
