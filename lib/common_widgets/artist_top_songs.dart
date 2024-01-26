import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ArtistTopSongsRow extends StatefulWidget {
  final Map songObj;
  final Map artistObj;
  final VoidCallback onPressed;

  const ArtistTopSongsRow(
      {super.key,
      required this.songObj,
      required this.artistObj,
      required this.onPressed});

  @override
  State<ArtistTopSongsRow> createState() => _ArtistTopSongsRowState();
}

class _ArtistTopSongsRowState extends State<ArtistTopSongsRow> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7.0,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: width / 7,
              width: width / 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                  onTap: () {},
                  child: Image(
                    image: AssetImage(widget.songObj["image"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: SizedBox(
                width: width,
                height: width / 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.songObj["songName"],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        widget.artistObj["name"],
                        style: GoogleFonts.ubuntu(
                            color: Colors.white.withOpacity(0.6), fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.onPressed,
              child: Image.asset(
                "assets/images/more.png",
                color: Colors.white,
                height: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
