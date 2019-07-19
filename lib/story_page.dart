import 'package:flutter/material.dart';
import 'package:interative_audio_book/backend/story_object.dart';

class StoryPage extends StatelessWidget {

  final Story selectedStory;
  StoryPage(this.selectedStory);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text(selectedStory.title),
        ),
      ),
    );
  }
}