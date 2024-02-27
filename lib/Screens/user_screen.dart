import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/common_widgets/data_collection.dart';
import 'package:test/common_widgets/user_screen_row.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingValue),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor,
                  ),
                  child: Image.asset(
                    "assets/images/user_profile.png",
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Astro",
                  style: GoogleFonts.oxygen(
                      color: primaryIconColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const UserScreenRow(image: "collection", text: "Playlists"),
            const UserScreenRow(image: "play_next", text: "My Mix"),
            const UserScreenRow(image: "lyrics", text: "Tracks"),
            const UserScreenRow(image: "display", text: "Videos"),
            const UserScreenRow(image: "download", text: "Downloaded"),
            const UserScreenRow(image: "other", text: "Setting"),
          ],
        ),
      )),
    );
  }
}
