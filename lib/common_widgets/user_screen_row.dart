import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data_collection.dart';

class UserScreenRow extends StatelessWidget {
  final String image;
  final String text;
  const UserScreenRow({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          Image.asset(
            "assets/images/$image.png",
            color: primaryIconColor,
            height: 30,
          ),
          const SizedBox(
            width: 35,
          ),
          Text(
            text,
            style: GoogleFonts.oxygen(
                fontSize: 18,
                color: primaryIconColor,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
