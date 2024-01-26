import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPlaylistScreenModel extends GetxController {
  final myplaylist = [
    {"image": "assets/images/study.jpg", "songName": "STUDY"},
    {"image": "assets/images/trip.jpg", "songName": "TRIP"},
    {"image": "assets/images/sleep.jpg", "songName": "SLEEP"},
    {"image": "assets/images/workout.jpg", "songName": "WORKOUT"}
  ].obs;

  final gridPlaylist = [
    {"color": Colors.pinkAccent, "type": "My Top Tracks", "number": "103"},
    {"color": Colors.purpleAccent, "type": "Lastest Added", "number": "263"},
    {"color": Colors.deepPurpleAccent, "type": "History", "number": "467"},
    {"color": Colors.redAccent, "type": "Favourites", "number": "189"},
  ].obs;
}
