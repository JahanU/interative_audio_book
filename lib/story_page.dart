import 'package:flutter/material.dart';
import 'package:interative_audio_book/backend/story_object.dart';

class StoryPage extends StatelessWidget {

  final Story selectedStory;
  StoryPage(this.selectedStory);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text(selectedStory.title),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: new Container(
              decoration: new BoxDecoration(
                  border: new Border.all(
                      color: Colors.white
                  )
              ),
              child: Image.network(
                selectedStory.image,
                width: 400.0,
                height: 200.0,
              )),
        ),
      ),
    );
  }
}