import 'package:flutter/material.dart';
import 'package:interative_audio_book/backend/story_object.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:interative_audio_book/backend/text_to_speech.dart'; // Stores other variables used for the textt to speech
import 'package:flutter_tts/flutter_tts.dart';
import 'backend/story_object.dart';

class StoryPage extends StatefulWidget {
  final Story selectedStory;

  StoryPage({Key key, this.selectedStory}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}


class _StoryPageState extends State<StoryPage> {
  SpeechRecognition _speechRecognition;
  String resultText = "";
  String selectedStoryText;
  bool _isAvaliable = false;
  bool _isListening = false;
  bool _pressAttention = false;
  bool _saidYes = false;
  bool _saidNo = false;

  var _storyCounter = -1;


  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
    initTts();
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
    newVoiceText = '';
  }

  initTts() {

    newVoiceText = selectedStoryText = widget.selectedStory.story;

    flutterTts = FlutterTts();
    _getLanguages();
    _getVoices();

    if (voices != null && languages != null) {
      voice = voices[1];
      language = languages[26];
    }

    flutterTts.setStartHandler(() => setState(() => ttsState = TtsState.playing));

    flutterTts.setCompletionHandler(() => setState(() => ttsState = TtsState.stopped));

    flutterTts.setErrorHandler((msg) => setState(() => ttsState = TtsState.stopped));
  } // Init ends

  Future _getLanguages() async {
    languages = await flutterTts.getLanguages;
    if (languages != null) setState(() => languages);
  }

  Future _getVoices() async {
    voices = await flutterTts.getVoices;
    if (voices != null) setState(() => voices);
  }

  Future _speak() async {
    if (newVoiceText != null) {
      if (newVoiceText.isNotEmpty) {
        var result = await flutterTts.speak(newVoiceText);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  List<DropdownMenuItem<String>> getLanguageDropDownMenuItems() {
    var items = List<DropdownMenuItem<String>>();
    for (String type in languages)
      items.add(DropdownMenuItem(value: type, child: Text(type)));

    return items;
  }

  List<DropdownMenuItem<String>> getVoiceDropDownMenuItems() {
    var items = List<DropdownMenuItem<String>>();
    for (String type in voices)
      items.add(DropdownMenuItem(value: type, child: Text(type)));

    return items;
  }

  void changedLanguageDropDownItem(String selectedType) {
    setState(() {
      language = selectedType;
      flutterTts.setLanguage(language);
    });
  }

  void changedVoiceDropDownItem(String selectedType) {
    setState(() {
      voice = selectedType;
      flutterTts.setVoice(voice);
    });
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
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.black,
                          width: 0.2,
                        ),
                      ),
                      child: new Text(
                        selectedStoryText,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(color: Colors.lightBlue[50]),
                child: Text(resultText),
              ),
              Container(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(children: [
                        voices != null && languages != null
                            ? voiceDropDownSection()
                            : Text("")
                      ]))),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButtonColumn(Colors.red, Colors.redAccent, Icons.stop,
                        'STOP', _stop),
                    _buildButtonColumn(Colors.green, Colors.greenAccent,
                        Icons.play_arrow, 'PLAY', _speak)
                  ]),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ///  CANCEL // CONFIRM // START
                  new RaisedButton(
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      child: Icon(Icons.cancel),
                      onPressed: () {
                        _speechRecognition.stop().then(
                              (result) => setState(() {
                                _isListening = result;
                                resultText = '';
                                _pressAttention = false;
                                _saidYes = false;
                                _saidNo = false;
                              }),
                            );
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),

                  new RaisedButton(
                      textColor: Colors.white,
                      color: Colors.yellowAccent[700],
                      child: Icon(Icons.done),
                      onPressed: () {
                        print('STORY COUNTER');
                        print(_storyCounter);
                        print('RESULT TEXT');
                        print(resultText);
                        print(storyOneAnswers[_storyCounter]);
                        print(storyOneAnswers[_storyCounter].contains(resultText));
//                        setState(() {
//                            if (storyOneAnswers[_storyCounter].contains(resultText)) {
//                                selectedStoryText = storyOne[_storyCounter];
//                                _storyCounter += 1;
//                                print('SELECTED STORY ONE');
//                            }
//                            else if (storyOneAnswersPart2[_storyCounter].contains(resultText)) {
//                            selectedStoryText = storyOnePart2[_storyCounter];
//                            _storyCounter += 1;
//                            print('SELECTED STORY TWO');
//                            }
//                          });
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  new RaisedButton(
                      textColor: Colors.white,
                      child: Icon(Icons.mic),
                      onPressed: () {
                        _pressAttention = !_pressAttention;

                        if (_pressAttention == true) {// Start state
                          _speechRecognition
                              .listen(locale: 'en_GB')
                              .then((result) => print(' $result'));
                        }
                        setState(() {
                            if (storyOneAnswers[_storyCounter].contains(resultText)) {
                                selectedStoryText = storyOne[_storyCounter];
                                _storyCounter += 1;
                                print('SELECTED STORY ONE');
                            }
                            else if (storyOneAnswersPart2[_storyCounter].contains(resultText)) {
                            selectedStoryText = storyOnePart2[_storyCounter];
                            _storyCounter += 1;
                            print('SELECTED STORY TWO');
                            }
                          });
                      },
                      color: _pressAttention ? Colors.blue : Colors.green,
                      padding: _pressAttention
                          ? EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 28.0)
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

  Widget voiceDropDownSection() => Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        DropdownButton( /// VOICE
          isDense: true,
          hint: new Text("Select accent", textAlign: TextAlign.center),
          value: voice,
          items: getVoiceDropDownMenuItems(),
          onChanged: changedVoiceDropDownItem,
        ),
        DropdownButton( /// LANGUAGES
        isDense: true,
        hint: new Text("Select Language", textAlign: TextAlign.center),
        value: language,
        items: getLanguageDropDownMenuItems(),
        onChanged: changedLanguageDropDownItem,
      )
      ]));

  Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(icon),
              color: color,
              splashColor: splashColor,
              onPressed: () => func()),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color)))
        ]);
  }
}
