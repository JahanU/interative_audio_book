import 'package:flutter/material.dart';

List<Story> allStories = [];

class Story {
  final String title;
  final String image;

  Story(this.title, this.image);
}

void createObject() {

  var _titles = [
    "Axe Trauma in the Woods (A)",
    "Whispers in the Dark (B)",
    "Story of Sparta (C)"
  ];
  var _images = [
    "https://i.ytimg.com/vi/wrRNj9gJezA/maxresdefault.jpg",
    "https://static.turbosquid.com/Preview/001242/868/9P/dark-horror-hospital-room-model_D.jpg",
    "http://etc.ancient.eu/wp-content/uploads/2016/08/MV5BMTI2OTA1MTEzMV5BMl5BanBnXkFtZTcwMzg1NTIyMw@@._V1_SX1777_CR001777927_AL_.jpg"
  ];

  for (int i = 0; i < _titles.length; i++) {
    allStories.add( new Story(_titles[i], _images[i]));
  }

}
