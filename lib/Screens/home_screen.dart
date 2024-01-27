import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test/Screens/album_screen.dart';
import 'package:test/common_widgets/data_collection.dart';
import 'package:test/common_widgets/albums_widget.dart';

import 'package:test/common_widgets/home_album.dart';

import 'package:test/common_widgets/title_viewall_section.dart';
import 'package:test/model/album_screen_model.dart';

import 'package:test/model/home_screen_model.dart';

import '../common_widgets/song_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeSM = Get.put(HomeScreenModel());
  final albumSM = Get.put(AlbumScreenModel());
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingValue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/images/home_menu.png",
                          fit: BoxFit.cover,
                          color: primaryIconColor,
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/images/home_profile.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const MixAlbum(),
                const SizedBox(
                  height: 20,
                ),
                TitleViewAll(
                    title: "Albums",
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const AlbumScreen();
                      }));
                    }),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingValue),
                  child: Row(
                    children: [
                      Album(
                        albumObj: albumSM.albums[2],
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: paddingValue,
                      ),
                      Album(
                        albumObj: albumSM.albums[3],
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TitleViewAll(title: "Recently Played", onPressed: () {}),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingValue),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: homeSM.recentlyPlayed.length,
                      itemBuilder: (context, index) {
                        var item = homeSM.recentlyPlayed[
                            homeSM.recentlyPlayed.length - (index + 1)];

                        return SongPreview(
                          songObj: item,
                          onPressed: () {},
                        );
                      }),
                )
              ],
            )),
      ),
    );
  }
}
