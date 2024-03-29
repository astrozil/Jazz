import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/Screens/main_screen.dart';

class SplashScreenModel extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void loadView() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.to(() => const MainTabScreen());
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.closeDrawer();
  }
}
