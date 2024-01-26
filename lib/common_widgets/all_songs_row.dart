import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AllSongsRow extends StatefulWidget {
  final Map songObj;
  final bool isWeb;
  final VoidCallback onPressed;
  final VoidCallback onPressedPlay;

  const AllSongsRow(
      {super.key,
      required this.songObj,
      required this.onPressed,
      required this.onPressedPlay,
      this.isWeb = false});

  @override
  State<AllSongsRow> createState() => _AllSongsRowState();
}

class _AllSongsRowState extends State<AllSongsRow> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        splashColor: Colors.transparent,
        onTap: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: width / 7,
                width: width / 7,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: widget.isWeb
                        ? CachedNetworkImage(
                            imageUrl: widget.songObj["imageUrl"].toString(),
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                "assets/images/lyrics.png",
                                fit: BoxFit.cover,
                              );
                            },
                            placeholder: (context, url) {
                              return Image.asset(
                                "assets/images/lyrics.png",
                                fit: BoxFit.cover,
                              );
                            },
                            width: 50,
                            height: 50,
                          )
                        : Image.asset(widget.songObj["imageUrl"]))),
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
                          style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      Text(
                        widget.songObj["artists"],
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
                onPressed: widget.onPressedPlay,
                icon: Image.asset(
                  "assets/images/allSongsPlay.png",
                ))
          ],
        ),
      ),
    );
  }
}
