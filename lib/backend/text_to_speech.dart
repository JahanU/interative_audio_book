import 'package:flutter_tts/flutter_tts.dart';

/*
Github repository:
https://github.com/dlutton/flutter_tts/blob/master/example/lib/main.dart

Note:
Don't forget to add: flutter_tts: ^0.2.6
to the pubspec.yaml file

Also if an error about the minSDK version appears, go to andriod->
-> app -> build.gradle file and change the minSdkVersion to 21
*/


enum TtsState {
  playing,
  stopped
}

  FlutterTts flutterTts;
  String newVoiceText = '';

  dynamic languages;
  dynamic voices;

  String language;
  String voice;

  TtsState ttsState = TtsState.stopped;
  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;

//Try playing: In the unknown lands of IBMChallenge, a group of 3 random developers lived a busy life. They used to be 7 but the remaining 4 mysteriously disappeared. End of Chapter 1