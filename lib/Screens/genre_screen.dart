import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common_widgets/genres_widget.dart';
import 'package:test/model/genre_screen_model.dart';

class GenreScreen extends StatelessWidget {
  GenreScreen({super.key});
  final genreSM = Get.put(GenreScreenModel());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.3,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 5),
              itemCount: genreSM.genres.length,
              itemBuilder: (context, index) {
                Map item = genreSM.genres[index];

                return Genres(genreObj: item);
              }),
        ));
  }
}
