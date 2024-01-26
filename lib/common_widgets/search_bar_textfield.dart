import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/home_screen_model.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeSm = Get.find<HomeScreenModel>();
    return Row(children: [
      Expanded(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: homeSm.txtSearch.value,
            decoration: InputDecoration(
                prefixIconConstraints: const BoxConstraints(),
                prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset("assets/images/search_bar.png",
                        height: 25)),
                hintStyle:
                    const TextStyle(color: Color.fromRGBO(148, 148, 150, 1)),
                hintText: "Artists, Songs, Lyrics and More"),
          ),
        ),
      )
    ]);
  }
}
