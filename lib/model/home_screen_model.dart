import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenModel extends GetxController {
  final txtSearch = TextEditingController().obs;

  final recommended = [
    {
      "image": "assets/images/ed sheeran.jpg",
      "artistName": "Ed Sheeran",
      "songName": "Perfect"
    },
    {
      "image": "assets/images/taylor swift.jpg",
      "artistName": "Taylor Swift",
      "songName": "Blank Space"
    },
    {
      "image": "assets/images/shawn mendes.jpg",
      "artistName": "Shawen Mendes",
      "songName": "Treat You Better"
    },
    {
      "image": "assets/images/charlie puth.jpg",
      "artistName": "Charlie Puth",
      "songName": "Attention"
    }
  ].obs;
  final playlist = [
    {"image": "assets/images/chill_playlist.jpg", "songName": "CHILL"},
    {"image": "assets/images/edm_playlist.jpg", "songName": "EDM"},
    {"image": "assets/images/pop_playlist.jpg", "songName": "POP"},
    {"image": "assets/images/rap_playlist.png", "songName": "RAP"}
  ].obs;

  final List recentlyPlayed = [].obs;
}
