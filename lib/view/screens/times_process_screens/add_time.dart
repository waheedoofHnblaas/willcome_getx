import 'dart:async';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:willcome_getx/controllers/timesProcess_controller/addTime_controller.dart';
import 'package:willcome_getx/core/constant/colors.dart';
import 'package:willcome_getx/view/widgets/app_appbar.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apploginbutton.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/applogintext.dart';
import 'package:willcome_getx/view/widgets/auth_widgets/apptextfield.dart';

class AddTimePage extends StatelessWidget {
  const AddTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddTimeControllerImp());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(title: 'Add New Time'),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Time Date',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 19),
                ),
                SizedBox(
                  height: 100,
                  width: Get.width,
                  child: CupertinoDatePicker(
                      onDateTimeChanged: (date) {
                        print(date);
                      },
                      mode: CupertinoDatePickerMode.dateAndTime),
                ),
              ],
            ),
            const SizedBox(
              height: 33,
              child: Divider(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Time Location',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 19),
                ),
                SizedBox(
                  height: 280,
                  width: Get.width,
                  child: GetBuilder<AddTimeControllerImp>(
                      builder: (getcontroller) {
                    return GoogleMap(
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        getcontroller.controllerMap.complete(controller);
                      },
                      onTap: (argument) async {
                        await getcontroller.getContacts();
                        print(argument);
                      },
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          getcontroller.myLat,
                          getcontroller.myLong,
                        ),
                        zoom: 0.1,
                      ),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(
              height: 33,
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                    child: Text(
                  'Time Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19),
                )),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 70,
                    child: AppTextField(
                      type: 'name',
                      iconData: Icons.local_activity_outlined,
                      inputType: TextInputType.name,
                      onChanged: (val) {},
                      validator: (val) {},
                      textFieldController: TextEditingController(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
