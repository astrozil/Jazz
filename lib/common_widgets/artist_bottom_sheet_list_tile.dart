import 'package:flutter/material.dart';
import 'package:test/common_widgets/data_collection.dart';

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
          color: primaryIconColor,
        ),
        title: Text(
          title,
          style: TextStyle(color: primaryIconColor, fontSize: 15),
        ),
      ),
    );
  }
}
