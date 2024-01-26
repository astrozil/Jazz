// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/common_widgets/data_collection.dart';

class TitleViewAll extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback onPressed;
  const TitleViewAll(
      {super.key,
      required this.title,
      this.buttonTitle = "View All",
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingValue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.oxygen(
                  color: primaryIconColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            child: Text(
              buttonTitle,
              style: GoogleFonts.oxygen(
                  color: primaryTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
