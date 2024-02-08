import 'dart:ffi';
import 'dart:ui';

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
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: 50,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: primaryIconColor,
                        ))),
                Expanded(
                    child: Center(
                  child: Text(
                    "Albums",
                    style: GoogleFonts.oxygen(
                        color: primaryIconColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )),
                SizedBox(
                  width: 50,
                )
              ],
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
                                  childAspectRatio: 0.78,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20),
                          itemCount: albumSM.albums.length,
                          itemBuilder: (context, index) {
                            Map item = albumSM.albums[index];

                            return Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 20),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(item["image"]),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    item["albumName"],
                                    style: GoogleFonts.oxygen(
                                        color: primaryIconColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    item["artistName"],
                                    style: GoogleFonts.oxygen(
                                      color: primaryIconColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
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
