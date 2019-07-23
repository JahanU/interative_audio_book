import 'package:flutter/material.dart';
import 'package:interative_audio_book/backend/story_object.dart';
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
  bool _pressAttention = false;

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
        (bool result) => setState(() => _isAvaliable = result));

    _speechRecognition.setRecognitionStartedHandler(
        () => setState(() => _isListening = true));

    _speechRecognition.setRecognitionResultHandler(
        (String speech) => setState(() => resultText = speech));

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(
        () {
          _isListening = false;
          _pressAttention = false;
        },
      ),
    );

    _speechRecognition
        .activate()
        .then((result) => setState(() => _isAvaliable = result));
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
              new Container(
                margin: const EdgeInsets.all(10.0),
                child: Image.network(
                  widget.selectedStory.image,
                  width: 400.0,
                  height: 200.0,
                ),
              ),
              new Container(
                child: Expanded(
                  child: new SingleChildScrollView(
                    child: new Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.black,
                          width: 0.2,
                        ),
                      ),
                      child: new Text(
                        widget.selectedStory.story,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(color: Colors.lightBlue[50]),
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
//                        if (_isListening == true) {
                        _speechRecognition.stop().then(
                              (result) => setState(() {
                                _isListening = result;
                                resultText = '';
                                _pressAttention = false;
                              }),
                            );
//                        }
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),

                  new RaisedButton(
                      textColor: Colors.white,
                      child: Icon(Icons.mic),
                      onPressed: () {
                        _pressAttention = !_pressAttention;

                        if (_pressAttention == true) {
                          // Start state
                          _speechRecognition
                              .listen(locale: 'en_GB')
                              .then((result) => print(' $result'));
                        }
                      },
                      color: _pressAttention ? Colors.blue : Colors.green,
                      padding: _pressAttention
                          ? EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 30.0)
                          : EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 24.0),
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
