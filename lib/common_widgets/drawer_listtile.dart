import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onPressed;
  const DrawerListTile(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListTile(
              leading: Image.asset(
                image,
                height: 36,
                width: 25,
                color: const Color.fromRGBO(255, 145, 77, 1),
              ),
              title: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Divider(
            indent: 70,
            color: Colors.white.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}
