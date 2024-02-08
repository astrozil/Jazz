import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:test/Screens/home_screen.dart';
import 'package:test/Screens/setting_screen.dart';
import 'package:test/Screens/song_screen.dart';
import 'package:test/common_widgets/drawer_listtile.dart';
import 'package:test/common_widgets/mini_player.dart';
import 'package:test/model/splash_screen_model.dart';
import 'package:test/common_widgets/data_collection.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedTab = 0;
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
    tabController = TabController(length: 3, vsync: this);
    tabController?.addListener(() {
      selectedTab = tabController?.index ?? 0;
      setState(() {});
    });
    onStart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var splashSM = Get.put(SplashScreenModel());
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [HomeScreen(), SongScreen(), SettingScreen()]),
          MiniPlayer(),
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
                      : primaryTextColor,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(radius))),
            ),
          ),
          AnimatedPositioned(
            duration:
                Duration(milliseconds: isFirstTextEnd == false ? 800 : 200),
            height: 40,
            width: 100,
            bottom: isFirstTextStart == false ? -40 : (device.height / 2) - 20,
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
              width: 150,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: secondTextDuratoin),
            height: 100,
            width: 210,
            left: (device.width / 2) - 105,
            curve: const ElasticOutCurve(1),
            bottom:
                isSecondTextStart == false ? -200 : (device.height / 2) - 45,
            child: Column(
              children: [
                Text(
                  "Journey",
                  style: GoogleFonts.oxygen(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: isVisible == true
                          ? Colors.white
                          : Colors.transparent),
                ),
                const SizedBox(height: 8),
                Text(
                  "Through Songs",
                  style: GoogleFonts.oxygen(
                      fontSize: 30,
                      color: isVisible == true
                          ? Colors.white
                          : Colors.transparent),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Visibility(
        visible: !isVisible,
        child: BottomAppBar(
          elevation: 0,
          color: backgroundColor,
          child: TabBar(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              splashFactory: NoSplash.splashFactory,
              labelStyle: const TextStyle(fontSize: 10),
              indicatorColor: Colors.transparent,
              controller: tabController,
              labelColor: const Color.fromRGBO(228, 136, 0, 1),
              unselectedLabelColor: const Color.fromRGBO(173, 184, 194, 1),
              tabs: [
                Tab(
                    height: 60,
                    iconMargin: const EdgeInsets.only(bottom: 5),
                    icon: Container(
                      width: 100,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          boxShadow: selectedTab != 0
                              ? []
                              : [
                                  BoxShadow(
                                      color: primaryTextColor, blurRadius: 1),
                                ],
                          color: selectedTab != 0
                              ? Colors.transparent
                              : primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Image.asset(
                        "assets/images/home.png",
                        color: selectedTab != 0
                            ? primaryTextColor
                            : primaryIconColor,
                      ),
                    )),
                Tab(
                    height: 60,
                    iconMargin: const EdgeInsets.only(bottom: 5),
                    icon: Container(
                      width: 100,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          boxShadow: selectedTab != 1
                              ? []
                              : [
                                  BoxShadow(
                                      color: primaryTextColor, blurRadius: 1),
                                ],
                          color: selectedTab != 1
                              ? Colors.transparent
                              : primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Image.asset(
                        "assets/images/songs.png",
                        color: selectedTab != 1
                            ? primaryTextColor
                            : primaryIconColor,
                      ),
                    )),
                Tab(
                    height: 60,
                    iconMargin: const EdgeInsets.only(bottom: 5),
                    icon: Container(
                      width: 100,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          boxShadow: selectedTab != 2
                              ? []
                              : [
                                  BoxShadow(
                                      color: primaryTextColor, blurRadius: 1),
                                ],
                          color: selectedTab != 2
                              ? Colors.transparent
                              : primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Image.asset(
                        "assets/images/collection.png",
                        color: selectedTab != 2
                            ? primaryTextColor
                            : primaryIconColor,
                      ),
                    )),
              ]),
        ),
      ),
    );
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

    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      radius = 3000;
      topValue = -2000;
      leftValue = -500;
      isVisible = false;
    });
  }
}
