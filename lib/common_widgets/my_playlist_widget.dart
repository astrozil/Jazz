import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPlaylist extends StatelessWidget {
  final Map songObj;

  const MyPlaylist({
    super.key,
    required this.songObj,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: 150,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: AssetImage(songObj["image"]), fit: BoxFit.cover)),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
                height: 60,
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      songObj["songName"],
                      style:
                          GoogleFonts.mukta(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              )),
        ));
  }
}
