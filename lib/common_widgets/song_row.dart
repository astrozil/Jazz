import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test/common_widgets/data_collection.dart';

class SongPreview extends StatefulWidget {
  final Map songObj;
  final VoidCallback onPressed;

  const SongPreview(
      {super.key, required this.songObj, required this.onPressed});

  @override
  State<SongPreview> createState() => _SongPreviewState();
}

class _SongPreviewState extends State<SongPreview> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                  onTap: () {},
                  child: Image(
                    image: NetworkImage(widget.songObj["imageUrl"]),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.songObj["name"],
                          style: GoogleFonts.oxygen(
                              color: primaryIconColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      Text(
                        widget.songObj["artists"],
                        style: GoogleFonts.oxygen(
                            color: primaryTextColor, fontSize: 12),
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
                color: primaryIconColor,
                height: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
