import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willcome_getx/controllers/home_controllers/timeData_controller.dart';
import 'package:willcome_getx/controllers/home_controllers/times_controller.dart';
import 'package:willcome_getx/core/class/statusrequest.dart';
import 'package:willcome_getx/core/constant/colors.dart';
import 'package:willcome_getx/view/widgets/app_appbar.dart';
import 'package:willcome_getx/view/widgets/home_widgets/apphome_leading.dart';
import 'package:willcome_getx/view/widgets/home_widgets/timeUsersList.dart';

class TimeDataPage extends StatelessWidget {
  TimeDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimesControllerImp timesControllerImp = Get.find();
    Get.lazyPut(()=>UsersTimesControllerImp(),fenix:  true,);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        personalData: Container(),
        title: 'Time Data',
        iconButton: Container(),
      ),
      body: GetBuilder<UsersTimesControllerImp>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 12),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    tileColor: AppColors.card,
                    title: Text(
                      controller.timeModel!.timesName!,
                      style: const TextStyle(fontSize: 33),
                    ),
                    subtitle: Text(controller.timeModel!.timesTime!),
                  ),
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  color: AppColors.card,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 33.0),
                    child: Text(
                      'from : ${timesControllerImp.getMyNum() == controller
                          .timeModel!.users_phone ?
                      'you' : controller.timeModel!.users_phone!}',
                      style: const TextStyle(fontSize: 33),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 12),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                            color: AppColors.card,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12),
                            child: TimeUsersList(),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 30,
                          right: 30,
                          child: FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.done),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
