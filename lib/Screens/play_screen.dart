import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:test/audio_helpers/page_manager.dart';
import 'package:test/audio_helpers/service_locator.dart';

import '../common_widgets/artist_bottom_sheet_list_tile.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({
    super.key,
  });

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();

    final media = MediaQuery.of(context).size;
    return Dismissible(
      key: const Key("playScreen"),
      direction: DismissDirection.down,
      background: const ColoredBox(color: Colors.transparent),
      onDismissed: (direction) {
        Get.back();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline_rounded)),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        enableDrag: true,
                        useSafeArea: true,
                        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            children: [
                              Container(
                                height: 80,
                                width: double.maxFinite,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                    color: Color.fromARGB(255, 40, 40, 40)),
                                child: Center(
                                  child: ListTile(
                                      leading:
                                          ValueListenableBuilder<MediaItem?>(
                                        valueListenable:
                                            pageManager.currentSongNotifier,
                                        builder: (context, mediaItem, child) {
                                          if (mediaItem == null) {
                                            return const SizedBox();
                                          }
                                          return CachedNetworkImage(
                                            height: 40,
                                            width: 40,
                                            imageUrl:
                                                mediaItem.artUri.toString(),
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, error) {
                                              return Image.asset(
                                                "assets/images/lyrics.png",
                                                fit: BoxFit.cover,
                                              );
                                            },
                                            placeholder: (context, url) {
                                              return Image.asset(
                                                "assets/images/lyrics.png",
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      title: ValueListenableBuilder<MediaItem?>(
                                        valueListenable:
                                            pageManager.currentSongNotifier,
                                        builder: (context, mediaItem, child) {
                                          if (mediaItem == null) {
                                            return const SizedBox();
                                          }
                                          return Text(
                                            mediaItem.title,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          );
                                        },
                                      ),
                                      trailing: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Image.asset(
                                          "assets/images/cancel.png",
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              ),
                              const ArtistBottomSheetListTile(
                                  image: "assets/images/lyrics.png",
                                  title: "Lyrics"),
                              const ArtistBottomSheetListTile(
                                  image: "assets/images/add_to_queue.png",
                                  title: "Add to queue"),
                              const ArtistBottomSheetListTile(
                                  image: "assets/images/library_add.png",
                                  title: "Save to library"),
                              const ArtistBottomSheetListTile(
                                  image: "assets/images/save_to_playlist.png",
                                  title: "Save to playist"),
                              const ArtistBottomSheetListTile(
                                  image: "assets/images/share.png",
                                  title: "Share"),
                            ],
                          );
                        });
                  },
                  icon: Image.asset(
                    "assets/images/more.png",
                    color: Colors.white,
                  ))
            ],
          ),
          body: ValueListenableBuilder<MediaItem?>(
            valueListenable: pageManager.currentSongNotifier,
            builder: (context, mediaItem, child) {
              if (mediaItem == null) return const SizedBox();
              return Column(children: [
                Hero(
                    tag: "currentArtWork",
                    child: ValueListenableBuilder(
                      valueListenable: pageManager.currentSongNotifier,
                      builder: (context, value, child) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            height: media.width - 100,
                            width: media.width - 60,
                            imageUrl: mediaItem.artUri.toString(),
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                "assets/images/lyrics.png",
                                fit: BoxFit.cover,
                              );
                            },
                            placeholder: (context, url) {
                              return Image.asset(
                                "assets/images/lyrics.png",
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        );
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      mediaItem.title,
                      style: GoogleFonts.biryani(
                          color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      mediaItem.artist!,
                      style:
                          GoogleFonts.biryani(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: pageManager.progressNotifier,
                  builder: (context, valueState, child) {
                    double? dragValue;
                    bool dragging = false;

                    final value = min(
                        valueState.current.inMilliseconds.toDouble(),
                        valueState.total.inMilliseconds.toDouble());
                    if (dragValue != null && dragging) dragValue = null;

                    return SfSliderTheme(
                      data: SfSliderThemeData(
                          thumbRadius: 0,
                          activeTrackHeight: 6.0,
                          inactiveTrackHeight: 6.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SfSlider(
                          min: 0,
                          max: max(valueState.current.inMilliseconds.toDouble(),
                                  valueState.total.inMilliseconds.toDouble()) +
                              0.0000000001,
                          value: value,
                          activeColor: Colors.white.withOpacity(0.7),
                          inactiveColor: Colors.white.withOpacity(0.4),
                          onChanged: (dynamic value) {
                            if (!dragging) {
                              dragging = true;
                            }
                            dragValue = value;
                            pageManager
                                .seek(Duration(milliseconds: value.round()));
                          },
                          onChangeEnd: (dynamic endValue) {
                            pageManager
                                .seek(Duration(milliseconds: endValue.round()));
                            dragging = false;
                          },
                        ),
                      ),
                    );
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: pageManager.progressNotifier,
                  builder: (context, valueState, child) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                                      .firstMatch('${valueState.current}')
                                      ?.group(1) ??
                                  '${valueState.current}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                                      .firstMatch('${valueState.total}')
                                      ?.group(1) ??
                                  '${valueState.total}',
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: pageManager.isFirstSongNotifier,
                      builder: (context, isFirst, child) {
                        return GestureDetector(
                            onTap: (isFirst) ? null : pageManager.previous,
                            child: Image.asset(
                              "assets/images/backward_button.png",
                              height: 40,
                            ));
                      },
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    ValueListenableBuilder<ButtonState>(
                      valueListenable: pageManager.playButtonNotifier,
                      builder: (context, buttonState, child) {
                        return GestureDetector(
                            onTap: (buttonState == ButtonState.playing)
                                ? pageManager.pause
                                : pageManager.play,
                            child: (buttonState == ButtonState.playing)
                                ? Image.asset(
                                    "assets/images/pause_button.png",
                                    height: 50,
                                  )
                                : Image.asset(
                                    "assets/images/play_button.png",
                                    height: 50,
                                  ));
                      },
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: pageManager.isLastSongNotifier,
                      builder: (context, isLast, child) {
                        return GestureDetector(
                            onTap: (isLast) ? null : pageManager.next,
                            child: Image.asset(
                              "assets/images/forward_button.png",
                              height: 40,
                            ));
                      },
                    ),
                  ],
                ),
              ]);
            },
          )),
    );
  }
}
