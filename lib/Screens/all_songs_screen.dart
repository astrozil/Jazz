import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/Screens/play_screen.dart';

import 'package:test/audio_helpers/player_invoke.dart';
import 'package:test/common_widgets/all_songs_row.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/model/all_songs_screen_model.dart';

class AllSongsScreen extends StatefulWidget {
  const AllSongsScreen({super.key});

  @override
  State<AllSongsScreen> createState() => _AllSongsScreenState();
}

final allSongsSM = Get.put(AllSongsScreenModel());

class _AllSongsScreenState extends State<AllSongsScreen> {
  bool _isLoading = false;
  Future<void> getDocs() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('allSongs').get();

      // Use the fetched data inside the FutureBuilder
      allSongsSM.allSongs = querySnapshot.docs
          .map((DocumentSnapshot<Map<String, dynamic>> doc) {
            Map<String, dynamic> data = doc.data()!;
            data["id"] = doc.id;
            return data;
          })
          .toList()
          .obs;
    } catch (error) {
      debugPrint("$error");
    }
  }

  Future<void> _refresh() async {
    setState(() {
      _isLoading = true;
    });

    await getDocs();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        notification.disallowGlow();
        return true;
      },
      child: RefreshIndicator(
        onRefresh: _refresh,
        color: Colors.black,
        child: _isLoading
            ? const Center(
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
              )
            : FutureBuilder(
                future: getDocs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {}
                    return Obx(() => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListView.builder(
                              physics: const ClampingScrollPhysics().parent,
                              itemCount: allSongsSM.allSongs.length,
                              itemBuilder: (context, index) {
                                Map item = allSongsSM.allSongs[index];
                                return AllSongsRow(
                                  songObj: item,
                                  isWeb: true,
                                  onPressed: () {
                                    if (item["id"] ==
                                        allSongsSM.currentId.value) {
                                      Future.delayed(
                                          const Duration(milliseconds: 100),
                                          () {
                                        Navigator.of(context)
                                            .push(PageRouteBuilder(
                                                opaque: false,
                                                pageBuilder: (_, __, ___) {
                                                  return const PlayScreen();
                                                }));
                                      });
                                    } else {
                                      playerPlayProcessDebounce(
                                        allSongsSM.allSongs
                                            .map((sObj) => {
                                                  'id': sObj["id"].toString(),
                                                  'title':
                                                      sObj['name'].toString(),
                                                  'artist': sObj['artists']
                                                      .toString(),
                                                  'album':
                                                      sObj['album'].toString(),
                                                  'genre':
                                                      sObj['genre'].toString(),
                                                  'image': sObj['imageUrl']
                                                      .toString(),
                                                  'url': sObj['downloadUrl']
                                                      .toString(),
                                                })
                                            .toList(),
                                        index,
                                      );
                                      Future.delayed(
                                          const Duration(milliseconds: 100),
                                          () {
                                        Navigator.of(context)
                                            .push(PageRouteBuilder(
                                                opaque: false,
                                                pageBuilder: (_, __, ___) {
                                                  return const PlayScreen();
                                                }));
                                      });
                                      allSongsSM.currentId.value =
                                          item["id".obs];
                                    }
                                  },
                                  onPressedPlay: () {
                                    playerPlayProcessDebounce(
                                        allSongsSM.allSongs
                                            .map((sObj) => {
                                                  'id': sObj["id"].toString(),
                                                  'title':
                                                      sObj['name'].toString(),
                                                  'artist': sObj['artists']
                                                      .toString(),
                                                  'album':
                                                      sObj['album'].toString(),
                                                  'genre':
                                                      sObj['genre'].toString(),
                                                  'image': sObj['imageUrl']
                                                      .toString(),
                                                  'url': sObj['downloadUrl']
                                                      .toString(),
                                                })
                                            .toList(),
                                        index);
                                    allSongsSM.currentId.value = item["id"];
                                  },
                                );
                              }),
                        ));
                  } else {
                    return const Center(
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                    );
                  }
                }),
      ),
    );
  }
}
