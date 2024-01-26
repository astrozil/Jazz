import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlbumSongsRow extends StatelessWidget {
  final String songName;
  final Map songObj;
  final bool isPlay;
  final int songIndex;
  final VoidCallback onPressed;
  final VoidCallback onPressedPlay;
  const AlbumSongsRow(
      {super.key,
      required this.songName,
      required this.songIndex,
      required this.songObj,
      required this.isPlay,
      required this.onPressed,
      required this.onPressedPlay});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              "${songIndex + 1}",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: SizedBox(
                width: width,
                height: width / 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          songName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      Text(
                        songObj["artistName"],
                        style: GoogleFonts.ubuntu(
                            color: Colors.white.withOpacity(0.6), fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: onPressedPlay,
                icon: Image.asset(
                  "assets/images/playlist_play.png",
                  color: Colors.white.withOpacity(0.6),
                ))
          ],
        ),
      ),
    );
  }
}
