import 'dart:async';

import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddTimeController extends GetxController {}

class AddTimeControllerImp extends AddTimeController {
  Completer<GoogleMapController> controllerMap = Completer();
  double myLat = 66.022, myLong = 66.022;

  @override
  Future<void> onInit() async {
    await getPosition();
    animateTo(
      myLat,
      myLong,
    );
    super.onInit();
  }

  List<Contact> contacts = [];

  Future<void> getContacts() async {
    FlutterContacts.config.includeNotesOnIos13AndAbove = true;
    print('===============getContacts=================');
    if (await FlutterContacts.requestPermission()) {
      // Get all contacts (lightly fetched)
      contacts = await FlutterContacts.getContacts();

      //  Get all contacts (fully fetched)
      // contacts = await FlutterContacts.getContacts(
      //     withProperties: true, withPhoto: false);
      for (Contact contact in contacts) {
        print(contact.name.first);
        print('================================');
      }
    }
  }

  Future<void> animateTo(double lat, double lng) async {
    final c = await controllerMap.future;
    final p = CameraPosition(target: LatLng(lat, lng), zoom: 11.4746);
    c.animateCamera(
      CameraUpdate.newCameraPosition(p),
    );
  }

  Future<Position> getMyLocation() async {
    Position cl = await Geolocator.getCurrentPosition().then((value) => value);
    print('==============getMyLocation=============');
    print(cl.latitude);
    print(cl.longitude);
    myLat = cl.latitude;
    myLong = cl.longitude;
    update();
    return cl;
  }

  Future<void> getPosition() async {
    LocationPermission per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per != LocationPermission.always) {
        await getMyLocation();
      }
    }
    if (per == LocationPermission.always) {
      await getMyLocation();
    }
  }
}
