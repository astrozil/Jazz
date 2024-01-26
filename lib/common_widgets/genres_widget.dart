import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Genres extends StatelessWidget {
  final Map genreObj;

  const Genres({
    super.key,
    required this.genreObj,
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
                  image: NetworkImage(genreObj["image"]), fit: BoxFit.cover)),
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
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      genreObj["name"],
                      style:
                          GoogleFonts.mukta(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              )),
        ));
  }
}
