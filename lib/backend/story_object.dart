import 'package:flutter/material.dart';

List<Story> allStories = [];

class Story {
  final String title;
  final String story;
  final String image;

  Story(this.title, this.story, this.image);
}

void createObject() {
  var _titles = [
    "Axe Trauma in the Woods (A)",
    "Whispers in the Dark (B)",
    "Story of Sparta (C)"
  ];
  var _stories = [
    """Miusov, as a man man of breeding and deilcacy, could not but feel some inwrd qualms, when he reached the Father Superior's with Ivan: he felt ashamed of havin lost his temper. "
    "He felt that he ought to have disdaimed that despicable wretch, Fyodor Pavlovitch, too much to have been upset by him in Father Zossima's cell, and so to have forgotten himself."
    "Teh monks were not to blame, in any case," he reflceted, on the steps. "And if they're decent people here (and the Father Superior, I understand, is a nobleman)
    why not be friendly and courteous withthem? I won't argue, I'll fall in with everything, I'll win them by politness, and show them that I've nothing to do with that Aesop,
    thta buffoon, that Pierrot, and have merely been takken in over this affair, just as they have. Miusov, as a man man of breeding and deilcacy, could not but feel some inwrd qualms, when he reached the Father Superior's with Ivan: he felt ashamed of havin lost his temper. "
    "He felt that he ought to have disdaimed that despicable wretch, Fyodor Pavlovitch, too much to have been upset by him in Father Zossima's cell, and so to have forgotten himself."
    "Teh monks were not to blame, in any case," he reflceted, on the steps. "And if they're decent people here (and the Father Superior, I understand, is a nobleman)
    why not be friendly and courteous withthem? I won't argue, I'll fall in with everything, I'll win them by politness, and show them that I've nothing to do with that Aesop,
    thta buffoon, that Pierrot, and have merely been takken in over this affair, just as they have.""",
    """Miusov, as a man man of breeding and deilcacy, could not but feel some inwrd qualms, when he reached the Father Superior's with Ivan: he felt ashamed of havin lost his temper. "
    "He felt that he ought to have disdaimed that despicable wretch, Fyodor Pavlovitch, too much to have been upset by him in Father Zossima's cell, and so to have forgotten himself."
    "Teh monks were not to blame, in any case," he reflceted, on the steps. "And if they're decent people here (and the Father Superior, I understand, is a nobleman)
    why not be friendly and courteous withthem? I won't argue, I'll fall in with everything, I'll win them by politness, and show them that I've nothing to do with that Aesop,
    thta buffoon, that Pierrot, and have merely been takken in over this affair, just as they have.""",
    """Miusov, as a man man of breeding and deilcacy, could not but feel some inwrd qualms, when he reached the Father Superior's with Ivan: he felt ashamed of havin lost his temper. "
    "He felt that he ought to have disdaimed that despicable wretch, Fyodor Pavlovitch, too much to have been upset by him in Father Zossima's cell, and so to have forgotten himself."
    "Teh monks were not to blame, in any case," he reflceted, on the steps. "And if they're decent people here (and the Father Superior, I understand, is a nobleman)
    why not be friendly and courteous withthem? I won't argue, I'll fall in with everything, I'll win them by politness, and show them that I've nothing to do with that Aesop,
    thta buffoon, that Pierrot, and have merely been takken in over this affair, just as they have."""
  ];
  var _images = [
    'https://i.ytimg.com/vi/wrRNj9gJezA/maxresdefault.jpg',
    'https://static.turbosquid.com/Preview/001242/868/9P/dark-horror-hospital-room-model_D.jpg',
    'http://etc.ancient.eu/wp-content/uploads/2016/08/MV5BMTI2OTA1MTEzMV5BMl5BanBnXkFtZTcwMzg1NTIyMw@@._V1_SX1777_CR001777927_AL_.jpg'
  ];

  for (int i = 0; i < _titles.length; i++) {
    allStories.add(new Story(_titles[i], _stories[i], _images[i]));
  }
}
