import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/Screens/album_details_screen.dart';

import 'package:test/common_widgets/data_collection.dart';
import 'package:test/model/album_screen_model.dart';

import '../common_widgets/albums_widget.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

final albumSM = Get.put(AlbumScreenModel());

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryIconColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                    width: 50,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: primaryColor,
                        ))),
                Expanded(
                    child: Center(
                  child: Text(
                    "Albums",
                    style: GoogleFonts.oxygen(
                        color: primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )),
                SizedBox(
                  width: 50,
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Obx(() => Flexible(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: paddingValue, right: paddingValue),
                      child: GridView.builder(
                          shrinkWrap: false,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 30),
                          itemCount: albumSM.albums.length,
                          itemBuilder: (context, index) {
                            Map item = albumSM.albums[index];

                            return Album(
                              albumObj: item,
                              onPressed: () {
                                Get.to(() => AlbumDetailsScreen(
                                      albumObj: item,
                                    ));
                              },
                            );
                          }),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
