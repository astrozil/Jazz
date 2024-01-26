import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/Screens/artist_details_screen.dart';
import 'package:test/common_widgets/artist_bottom_sheet_list_tile.dart';
import 'package:test/model/artist_screen_model.dart';

class ArtistScreen extends StatelessWidget {
  ArtistScreen({super.key});
  final artistSM = Get.put(ArtistScreenModel());
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: artistSM.artists.length,
        itemBuilder: (context, index) {
          Map artistObj = artistSM.artists[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Get.to(() => ArtistDetailsScreen(
                      artistObj: artistObj,
                    ));
              },
              child: SizedBox(
                width: double.maxFinite,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        artistObj["image"],
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      artistObj["name"],
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: double.infinity,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            enableDrag: true,
                            useSafeArea: true,
                            backgroundColor:
                                const Color.fromARGB(255, 33, 33, 33),
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
                                          leading: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.asset(
                                              artistObj["image"],
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          title: Text(
                                            artistObj["name"],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
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
                                      image: "assets/images/album_play.png",
                                      title: "Play all"),
                                  const ArtistBottomSheetListTile(
                                      image: "assets/images/play_next.png",
                                      title: "Play next"),
                                  const ArtistBottomSheetListTile(
                                      image: "assets/images/add_to_queue.png",
                                      title: "Add to queue"),
                                  const ArtistBottomSheetListTile(
                                      image: "assets/images/library_add.png",
                                      title: "Save to library"),
                                  const ArtistBottomSheetListTile(
                                      image:
                                          "assets/images/save_to_playlist.png",
                                      title: "Save to playist"),
                                  const ArtistBottomSheetListTile(
                                      image: "assets/images/share.png",
                                      title: "Share"),
                                ],
                              );
                            });
                      },
                      child: Image.asset(
                        "assets/images/more.png",
                        height: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
