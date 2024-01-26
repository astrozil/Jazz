import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridPlaylist extends StatelessWidget {
  final Map songObj;
  final VoidCallback onPressed;
  const GridPlaylist(
      {super.key, required this.songObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: songObj["color"], borderRadius: BorderRadius.circular(10)),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                songObj["type"],
                style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              Text(
                "${songObj["number"]} songs",
                style:
                    GoogleFonts.poppins(color: Colors.white.withOpacity(0.7)),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 5,
            right: 10,
            child: InkWell(
              onTap: onPressed,
              child: Image.asset(
                "assets/images/playlist_play.png",
              ),
            ))
      ],
    );
  }
}
