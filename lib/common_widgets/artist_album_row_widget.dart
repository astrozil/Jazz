import 'package:flutter/material.dart';

class ArtistAlbumRow extends StatelessWidget {
  final Map artistAlbumObj;
  const ArtistAlbumRow({super.key, required this.artistAlbumObj});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 220,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              artistAlbumObj["image"],
              width: 200,
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          artistAlbumObj["name"],
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Album . ${artistAlbumObj["year"]}",
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14),
        )
      ]),
    );
  }
}
