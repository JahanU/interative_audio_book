import 'package:flutter/material.dart';
import 'package:interative_audio_book/backend/story_object.dart';
import 'backend/voice_to_text.dart';
import 'package:speech_recognition/speech_recognition.dart';



class StoryPage extends StatefulWidget {
  final Story selectedStory;

  StoryPage({Key key, this.selectedStory}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  SpeechRecognition _speechRecognition;
  String resultText = "";
  bool _isAvaliable = false;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
          (bool result) => setState(() => _isAvaliable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
          () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
          (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
          () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvaliable = result),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.selectedStory.title),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                widget.selectedStory.image,
                width: 400.0,
                height: 200.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width *
                    0.6, // Gets 60% width of the screen
                height: MediaQuery.of(context).size.height *
                    0.1, // Gets 60% width of the screen

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.cyanAccent[100]),
                child: Text(resultText),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  /// START // STOP/PAUSE // CANCEL
                  new RaisedButton(
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      child: Icon(Icons.cancel),
                      onPressed: () {
                        if (_isListening == true) {
                          _speechRecognition.stop().then(
                                (result) => setState(() {
                                  _isListening = result;
                                  resultText = '';
                                }),
                              );
                        }
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),

                  new RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Icon(Icons.mic),
                      onPressed: () {
                        print(_isAvaliable);
                        print(_isListening);

                        if (_isAvaliable == true && _isListening == false) {
                          // Start state
                          _speechRecognition.listen(locale: 'en_GB')
                              .then((result) => print('$result'));
                        }
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),

                  new RaisedButton(
                      textColor: Colors.white,
                      color: Colors.orangeAccent,
                      child: Icon(Icons.stop),
                      onPressed: () {
                        if (_isListening == true) {
                          _speechRecognition.stop().then(
                                (result) =>
                                    setState(() => _isListening = result),
                              );
                        }
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ],
              )
            ],
          ),
          decoration:
              new BoxDecoration(border: new Border.all(color: Colors.white)),
        ),
      ),
    );
  }
}
