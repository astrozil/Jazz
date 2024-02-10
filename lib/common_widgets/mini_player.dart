import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:just_audio/just_audio.dart';
import 'package:test/Screens/play_screen.dart';

import 'package:test/audio_helpers/page_manager.dart';
import 'package:test/common_widgets/control_buttons.dart';
import 'package:test/common_widgets/data_collection.dart';

import '../audio_helpers/service_locator.dart';

class MiniPlayer extends StatefulWidget {
  static const MiniPlayer _instance = MiniPlayer._internal();
  factory MiniPlayer() {
    return _instance;
  }
  const MiniPlayer._internal();

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();

    return ValueListenableBuilder(
        valueListenable: pageManager.playbackStatNotifier,
        builder: (context, processingState, __) {
          if (processingState == ProcessingState.idle) {
            return const SizedBox();
          }
          return ValueListenableBuilder<MediaItem?>(
              valueListenable: pageManager.currentSongNotifier,
              builder: (context, mediaItem, ___) {
                if (mediaItem == null) {
                  return const SizedBox();
                }
                return Dismissible(
                  key: Key(mediaItem.id),
                  confirmDismiss: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      pageManager.previous();
                    } else {
                      pageManager.next();
                    }
                    return Future.value(false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1, vertical: 1.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(color: primaryTextColor, blurRadius: 3)
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 1.0),
                          elevation: 0,
                          color: primaryColor,
                          child: SizedBox(
                              height: 79,
                              child: ClipRRect(
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ValueListenableBuilder<ProgressBarState>(
                                          valueListenable:
                                              pageManager.progressNotifier,
                                          builder: (context, value, __) {
                                            final position = value.current;
                                            final totalDuration = value.total;
                                            return position == null
                                                ? const SizedBox()
                                                : (position
                                                                .inSeconds
                                                                .toDouble() <
                                                            0.0 ||
                                                        (position
                                                                .inSeconds
                                                                .toDouble() >
                                                            totalDuration
                                                                .inSeconds
                                                                .toDouble()))
                                                    ? const SizedBox()
                                                    : SliderTheme(
                                                        data: SliderThemeData(
                                                            activeTrackColor:
                                                                Colors.black,
                                                            inactiveTrackColor: Colors
                                                                .transparent,
                                                            trackHeight: 5.0,
                                                            thumbColor:
                                                                primaryTextColor,
                                                            thumbShape:
                                                                const RoundSliderOverlayShape(
                                                              overlayRadius:
                                                                  2.5,
                                                            ),
                                                            overlayColor: Colors
                                                                .transparent,
                                                            overlayShape:
                                                                RoundSliderOverlayShape(
                                                                    overlayRadius:
                                                                        2.0)),
                                                        child: Slider(
                                                          inactiveColor: Colors
                                                              .transparent,
                                                          max: totalDuration
                                                              .inSeconds
                                                              .toDouble(),
                                                          value: position
                                                              .inSeconds
                                                              .toDouble(),
                                                          onChanged:
                                                              (newPosition) {
                                                            pageManager.seek(Duration(
                                                                seconds:
                                                                    newPosition
                                                                        .round()));
                                                          },
                                                        ));
                                          }),
                                      Material(
                                        color: Colors.white10,
                                        child: ListTile(
                                            tileColor:
                                                Colors.white.withOpacity(0.1),
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  PageRouteBuilder(
                                                      opaque: false,
                                                      pageBuilder:
                                                          (_, __, ___) {
                                                        return const PlayScreen();
                                                      }));
                                            },
                                            title: Text(
                                              mediaItem.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.oxygen(
                                                  color: primaryIconColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              mediaItem.artist ?? "",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.oxygen(
                                                  color: primaryTextColor),
                                            ),
                                            trailing: const ControlButtons(
                                                miniPlayer: true,
                                                buttons: [
                                                  'Previous',
                                                  'Play/Pause',
                                                  'Next'
                                                ]),
                                            leading: Hero(
                                                tag: "currentArtWork",
                                                child: Card(
                                                    elevation: 0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    child: CachedNetworkImage(
                                                      imageUrl: mediaItem.artUri
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                          url, error) {
                                                        return Image.asset(
                                                          "assets/images/lyrics.png",
                                                          fit: BoxFit.cover,
                                                        );
                                                      },
                                                      placeholder:
                                                          (context, url) {
                                                        return Image.asset(
                                                          "assets/images/lyrics.png",
                                                          fit: BoxFit.cover,
                                                        );
                                                      },
                                                    )))),
                                      )
                                    ]),
                              )),
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
