import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common_widgets/album_songs_row.dart';

import 'package:test/model/album_screen_model.dart';

class AlbumDetailsScreen extends StatefulWidget {
  final Map albumObj;

  const AlbumDetailsScreen({
    super.key,
    required this.albumObj,
  });

  @override
  State<AlbumDetailsScreen> createState() => _AlbumDetailsScreenState();
}

final albumSM = Get.find<AlbumScreenModel>();

class _AlbumDetailsScreenState extends State<AlbumDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    List songsList = widget.albumObj["songs"];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.back();
          },
        ),
        title: Center(
          child: Text(
            widget.albumObj["artistName"],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/search_appbar.png",
                  color: Colors.white.withOpacity(0.8),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(alignment: Alignment.center, children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    width: media.width,
                    height: media.height / 2.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.albumObj["image"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.9),
                                Colors.black.withOpacity(0.4)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: const [0.3, 1])),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(widget.albumObj["image"]))),
                )
              ]),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.albumObj["albumName"],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      radius: 18,
                      child: Image.asset(
                        "assets/images/download.png",
                        color: Colors.white,
                        height: 16,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      radius: 18,
                      child: Image.asset(
                        "assets/images/library_add.png",
                        color: Colors.white,
                        height: 16,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: Image.asset(
                        "assets/images/album_play.png",
                        color: Colors.black,
                        height: 20,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      radius: 18,
                      child: Image.asset(
                        "assets/images/favourite.png",
                        color: Colors.white,
                        height: 16,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      radius: 18,
                      child: Image.asset(
                        "assets/images/shuffle.png",
                        color: Colors.white,
                        height: 16,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: songsList.length,
                    itemBuilder: (context, index) {
                      var item = songsList[index];
                      return AlbumSongsRow(
                          songName: item,
                          songIndex: index,
                          songObj: widget.albumObj,
                          onPressed: () {},
                          isPlay: index == 0,
                          onPressedPlay: () {});
                    }),
              )
            ],
          )),
    );
  }
}
