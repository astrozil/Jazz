import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/model/splash_screen_model.dart';
import 'package:lottie/lottie.dart';
import 'package:test/common_widgets/data_collection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashSM = Get.put(SplashScreenModel());
  bool isIconStart = false;
  bool isFirstTextStart = false;
  bool isFirstTextEnd = false;
  bool isSecondTextStart = false;
  int secondTextDuratoin = 500;
  double radius = 0;
  double leftValue = 0;
  double topValue = 0;
  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    onStart();

    // splashSM.loadView();
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            AnimatedPositioned(
              left: leftValue,
              top: topValue,
              duration: const Duration(milliseconds: 700),
              child: Container(
                height: device.height,
                width: device.width,
                decoration: BoxDecoration(
                    color: isSecondTextStart == false
                        ? Colors.white
                        : defaultColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(radius))),
              ),
            ),
            AnimatedPositioned(
              duration:
                  Duration(milliseconds: isFirstTextEnd == false ? 800 : 200),
              height: 40,
              width: 100,
              bottom:
                  isFirstTextStart == false ? -40 : (device.height / 2) - 20,
              left: isFirstTextEnd == false ? (device.width / 2) - 120 : -200,
              child: const Text(
                "JAZZ",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            AnimatedPositioned(
              duration:
                  Duration(milliseconds: isFirstTextEnd == false ? 800 : 200),
              right: isIconStart == false ? -150 : (device.width / 2) - 120,
              top: (device.height / 2) - 75,
              child: Lottie.asset(
                  "assets/animations/splashScreenAnimation.json",
                  height: 150,
                  width: 150),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: secondTextDuratoin),
              height: 90,
              width: 210,
              left: (device.width / 2) - 105,
              curve: ElasticOutCurve(1),
              bottom:
                  isSecondTextStart == false ? -200 : (device.height / 2) - 45,
              child: Column(
                children: [
                  Text(
                    "Journey",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: isVisible == true
                            ? Colors.black
                            : Colors.transparent),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Through Songs",
                    style: TextStyle(
                        fontSize: 30,
                        color: isVisible == true
                            ? Colors.black
                            : Colors.transparent),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Future<void> onStart() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isIconStart = true;

      isFirstTextStart = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isIconStart = false;
      isFirstTextEnd = true;
    });
    setState(() {
      isSecondTextStart = true;
    });

    await Future.delayed(Duration(seconds: 1));
    setState(() {
      radius = 3000;
      topValue = -2000;
      leftValue = -500;
      isVisible = false;
    });
  }
}
