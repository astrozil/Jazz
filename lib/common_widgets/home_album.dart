import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/common_widgets/data_collection.dart';

class MixAlbum extends StatelessWidget {
  const MixAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: paddingValue),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: device.width,
      height: 200,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(30)),
      child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/images/album_back.png",
              height: 160,
              width: 160,
              fit: BoxFit.cover,
            )),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Spider-Man: Across the Spider-Verse",
                  style: GoogleFonts.oxygen(
                    color: primaryIconColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4), blurRadius: 3),
                    ],
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: Text("Listen Now",
                      style: GoogleFonts.oxygen(
                        color: primaryIconColor,
                        fontSize: 15,
                      )),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
