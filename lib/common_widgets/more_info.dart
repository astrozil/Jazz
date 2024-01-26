import 'package:flutter/material.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 4,
          decoration:
              const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          child: const Text(""),
        ),
        Container(
          width: 4,
          decoration:
              const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          child: const Text(""),
        )
      ],
    );
  }
}
