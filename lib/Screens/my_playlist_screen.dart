import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common_widgets/grid_playlist_widget.dart';
import 'package:test/common_widgets/my_playlist_widget.dart';
import 'package:test/common_widgets/title_viewall_section.dart';
import 'package:test/model/my_playlist_screen_model.dart';

class MyPlaylistScreen extends StatefulWidget {
  const MyPlaylistScreen({super.key});

  @override
  State<MyPlaylistScreen> createState() => _MyPlaylistScreenState();
}

final myPlaylistSM = Get.put(MyPlaylistScreenModel());

class _MyPlaylistScreenState extends State<MyPlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Obx(() => SizedBox(
              height: 290,
              width: MediaQuery.of(context).size.width - 20,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      crossAxisCount: 2,
                      childAspectRatio: 1.4),
                  itemCount: myPlaylistSM.gridPlaylist.length,
                  itemBuilder: (context, index) {
                    var item = myPlaylistSM.gridPlaylist[index];
                    return GridPlaylist(
                      songObj: item,
                      onPressed: () {},
                    );
                  }),
            )),
        TitleViewAll(title: "My Playlists", onPressed: () {}),
        SizedBox(
          height: 130,
          child: Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: myPlaylistSM.myplaylist.length,
                    itemBuilder: (context, index) {
                      Map item = myPlaylistSM.myplaylist[index];
                      return MyPlaylist(
                        songObj: item,
                      );
                    }),
              )),
        ),
      ]),
    );
  }
}
