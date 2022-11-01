import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/approutes.dart';
import 'package:willcome_getx/controllers/auth_controllers/logout_controller.dart';
import 'package:willcome_getx/controllers/home_controllers/times_controller.dart';
import 'package:willcome_getx/core/class/statusrequest.dart';
import 'package:willcome_getx/core/constant/colors.dart';
import 'package:willcome_getx/view/widgets/app_appbar.dart';
import 'package:willcome_getx/view/widgets/home_widgets/apphome_leading.dart';
import 'package:willcome_getx/view/widgets/home_widgets/timecard_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LogoutControllerImp());
    TimesControllerImp controllerImp = Get.put(TimesControllerImp());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addtime);
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        title: 'Home',
        personalData: Padding(
          padding: const EdgeInsets.only(right: 22.0, top: 8, bottom: 0),
          child: Text(
            controllerImp.getMyName(),
            style: const TextStyle(fontSize: 18),
          ),
        ),
        iconButton: const AppHomeLeading(),
      ),
      body: GetBuilder<TimesControllerImp>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.timesList.isEmpty) {
          return Center(
            child: Text(
              'No times\nyet',
              style: TextStyle(
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return ListView.builder(
            addAutomaticKeepAlives: true,
            itemCount: controller.timesList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    controllerImp.toTimeData(controller.timesList[index]);
                  },
                  child: TimeCardData(time: controller.timesList[index]));
            },
          );
        }
      }),
    );
  }
}
