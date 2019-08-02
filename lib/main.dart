import 'package:flutter/material.dart';
import 'story_page.dart';
import 'package:interative_audio_book/backend/story_object.dart';

main() {
  createObject();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "IBM Challenge 2019",
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Stories"),
            centerTitle: true,
            backgroundColor: Colors.teal,
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.record_voice_over),
                tooltip: "Instructions",
                onPressed: () {
                  print("Text to speech for instructions here");
                },
              )
            ],
          ),
          body: new HomeWidget(),
        ));
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(allStories.length);

    return new ListView.builder(
      itemCount: allStories.length,
      itemBuilder: (context, index) {
        return new FlatButton(
          onPressed: () {
            // Open story Page
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new StoryPage(selectedStory: allStories[index])));
          },
          child: new Column(
            children: <Widget>[
              new Tooltip(
                child: new Container(
                    padding: new EdgeInsets.all(14.0),
                    child: new Column(children: <Widget>[
                      new Container(
                          decoration: new BoxDecoration(
                              border: new Border.all(color: Colors.white)),
                          child: Image.network(
                            allStories[index].image,
                            width: 400.0,
                            height: 200.0,
                          )),
//                      new Icon(
//                        Icons.play_circle_filled,
//                      ),
                      new Text(allStories[index].title,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                    ])),
                message: "Play",
              )
              //new Divider(
              //color: Colors.white,
              //)
            ],
          ),
        );
      },
    );
  }
}
