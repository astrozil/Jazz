import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common_widgets/artist_album_row_widget.dart';
import 'package:test/common_widgets/artist_latest_release.dart';
import 'package:test/common_widgets/artist_top_songs.dart';

import 'package:test/common_widgets/title_section.dart';
import 'package:test/common_widgets/title_viewall_section.dart';

class ArtistDetailsScreen extends StatelessWidget {
  final Map artistObj;
  const ArtistDetailsScreen({super.key, required this.artistObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    List artistAlbums = artistObj["albums"];
    List artistTopSongs = artistObj["topSongs"];
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(alignment: Alignment.center, children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    width: media.width,
                    height: media.height / 2.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(artistObj["image"]),
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
                        child: Image.asset(
                          artistObj["image"],
                          fit: BoxFit.cover,
                        ),
                      )),
                )
              ]),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  artistObj["name"],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.8),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/shuffle.png"),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Shuffle",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.6), width: 0.8),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/album_play.png",
                            height: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Play",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              LatestRelease(
                artistAlbumObj: artistObj,
              ),
              const SizedBox(
                height: 30,
              ),
              TitleViewAll(title: "Top Songs", onPressed: () {}),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: artistTopSongs.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final songObj = artistTopSongs[index];
                        if (index < 5) {
                          return ArtistTopSongsRow(
                              songObj: songObj,
                              artistObj: artistObj,
                              onPressed: () {});
                        } else {
                          return null;
                        }
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TitleRow(title: "Albums"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  height: 260,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: false,
                      itemCount: artistAlbums.length,
                      itemBuilder: (context, index) {
                        final artistAlbumObj =
                            artistAlbums[(artistAlbums.length - index) - 1];
                        return ArtistAlbumRow(artistAlbumObj: artistAlbumObj);
                      }),
                ),
              )
            ],
          )),
    );
  }
}
