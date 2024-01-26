import 'package:flutter/material.dart';

class LatestRelease extends StatelessWidget {
  final Map artistAlbumObj;
  const LatestRelease({super.key, required this.artistAlbumObj});

  @override
  Widget build(BuildContext context) {
    final List albumList = artistAlbumObj["albums"];
    final Map latestAlbum = albumList[albumList.length - 1];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.maxFinite,
        height: 110,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "LATEST RELEASE",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      latestAlbum["name"],
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Album . ${latestAlbum["year"]}",
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      latestAlbum["image"],
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
