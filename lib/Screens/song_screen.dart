import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/common_widgets/data_collection.dart';
// import 'package:get/get.dart';
// import 'package:test/Screens/album_screen.dart';
// import 'package:test/Screens/all_songs_screen.dart';
// import 'package:test/Screens/artists_screen.dart';
// import 'package:test/Screens/genre_screen.dart';
// import 'package:test/Screens/my_playlist_screen.dart';
// import 'package:test/common_widgets/data_collection.dart';
// import '../model/splash_screen_model.dart';

// class SongScreen extends StatefulWidget {
//   const SongScreen({super.key});

//   @override
//   State<SongScreen> createState() => _SongScreenState();
// }

// TabController? tabController;
// int selectedTab = 0;

// class _SongScreenState extends State<SongScreen>
//     with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 5, vsync: this);
//     tabController?.addListener(() {
//       selectedTab = tabController!.index;
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         toolbarHeight: 100,
//         elevation: 0,
//         backgroundColor: backgroundColor,
//         leading: IconButton(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           icon: Image.asset(
//             "assets/images/menu.png",
//             width: 60,
//           ),
//           onPressed: () {
//             Get.find<SplashScreenModel>().openDrawer();
//           },
//         ),
//         title: const Center(
//           child: Text(
//             "Songs",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: IconButton(
//                 onPressed: () {},
//                 icon: Image.asset(
//                   "assets/images/search_appbar.png",
//                   color: Colors.white.withOpacity(0.8),
//                 )),
//           )
//         ],
//       ),
//       body: Column(children: [
//         SizedBox(
//           height: kToolbarHeight - 15,
//           child: TabBar(
//               indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
//               overlayColor: MaterialStateProperty.all(Colors.transparent),
//               splashFactory: NoSplash.splashFactory,
//               indicatorColor: const Color.fromRGBO(255, 145, 77, 1),
//               physics: const BouncingScrollPhysics(),
//               isScrollable: true,
//               controller: tabController,
//               tabs: const [
//                 Tab(
//                   child: Text(
//                     "All Songs",
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     "Playlists",
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     "Albums",
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     "Artists",
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     "Genres",
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//               ]),
//         ),
//         Expanded(
//           child: TabBarView(
//               physics: const NeverScrollableScrollPhysics(),
//               controller: tabController,
//               children: [
//                 const AllSongsScreen(),
//                 const MyPlaylistScreen(),
//                 const AlbumScreen(),
//                 ArtistScreen(),
//                 GenreScreen()
//               ]),
//         )
//       ]),
//     );
//   }
// }

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search",
              style: GoogleFonts.oxygen(
                  fontSize: 30,
                  color: primaryIconColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  "assets/images/search.png",
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: TextFormField(
                    cursorColor: Colors.black,
                    controller: searchTextController,
                    decoration: InputDecoration(
                      hintText: "Song or Artist",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      )),
    );
  }
}
