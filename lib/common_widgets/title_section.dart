// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  final title;
  const TitleRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 0.3,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
