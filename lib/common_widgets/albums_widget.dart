import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Album extends StatelessWidget {
  final Map albumObj;

  final VoidCallback onPressed;
  const Album({super.key, required this.albumObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Container(
            width: (device.width / 2) - 50,
            height: (device.width / 2) - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  image: AssetImage(albumObj["image"]), fit: BoxFit.cover),
            ),
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: Blur(
                    overlay: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    albumObj["albumName"],
                                    style: GoogleFonts.oxygen(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    albumObj["artistName"],
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: GoogleFonts.oxygen(
                                        decorationStyle:
                                            TextDecorationStyle.dotted,
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                            Image.asset("assets/images/play.png")
                          ]),
                    ),
                    borderRadius: BorderRadius.circular(25),
                    blur: 10,
                    colorOpacity: 0.2,
                    blurColor: Colors.grey,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      height: 50,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
