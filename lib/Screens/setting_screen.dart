import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common_widgets/data_collection.dart';
import '../common_widgets/drawer_listtile.dart';
import '../model/splash_screen_model.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          elevation: 0,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Row(children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Image.asset(
                      "assets/images/menu.png",
                      width: 60,
                    ),
                    onPressed: () {
                      Get.find<SplashScreenModel>().openDrawer();
                    },
                  ),
                ),
              ),
              const Text(
                "Setting",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer()
            ]),
          ),
          backgroundColor: backgroundColor,
        ),
        body:
            ListView(physics: const NeverScrollableScrollPhysics(), children: [
          const SizedBox(
            height: 30,
          ),
          DrawerListTile(
            image: "assets/images/display.png",
            title: "Display",
            onPressed: () {},
          ),
          DrawerListTile(
              image: "assets/images/upload.png",
              title: "Upload",
              onPressed: () {}),
          DrawerListTile(
              image: "assets/images/audio.png",
              title: "Audio",
              onPressed: () {}),
          DrawerListTile(
              image: "assets/images/headset.png",
              title: "Headset",
              onPressed: () {}),
          DrawerListTile(
              image: "assets/images/lockscreen.png",
              title: "Lock Screen",
              onPressed: () {}),
          DrawerListTile(
              image: "assets/images/advanced.png",
              title: "Advanced",
              onPressed: () {}),
          DrawerListTile(
              image: "assets/images/other.png",
              title: "Other",
              onPressed: () {}),
        ]),
      ),
    );
  }
}
