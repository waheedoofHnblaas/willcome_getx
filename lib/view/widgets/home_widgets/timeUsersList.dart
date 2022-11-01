import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/controllers/home_controllers/timeData_controller.dart';
import 'package:willcome_getx/controllers/home_controllers/times_controller.dart';
import 'package:willcome_getx/core/constant/colors.dart';

class TimeUsersList extends StatelessWidget {
  const TimeUsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersTimesControllerImp controller =
    Get.find();
    TimesControllerImp timesControllerImp = Get.find();
    return ListView.builder(
      shrinkWrap: true,
      primary: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: controller.userList.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 6,
              ),
              child: Text(
                timesControllerImp.getMyName() ==
                    controller.userList[index].usersName!
                    ? 'you'
                    : controller.userList[index].usersName!,
              ),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
