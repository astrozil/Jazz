import 'package:flutter/material.dart';

class Recommended extends StatefulWidget {
  final Map songObj;
  const Recommended({super.key, required this.songObj});

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50),
      width: 230,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            widget.songObj["image"],
            width: double.maxFinite,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.songObj["songName"],
          maxLines: 1,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white.withOpacity(0.6)),
        ),
        Text(
          widget.songObj["artistName"],
          maxLines: 1,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white.withOpacity(0.4)),
        ),
      ]),
    );
  }
}
