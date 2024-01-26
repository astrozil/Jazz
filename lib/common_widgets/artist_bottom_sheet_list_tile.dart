import 'package:flutter/material.dart';

class ArtistBottomSheetListTile extends StatelessWidget {
  final String image;
  final String title;
  const ArtistBottomSheetListTile(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListTile(
        leading: Image.asset(
          image,
          height: 25,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
