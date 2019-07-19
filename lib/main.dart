import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
  List<int> _pauseTracker = [0,0,0];
  List<Color> _borderColors = [Colors.white, Colors.white, Colors.white];
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

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: 3,
      itemBuilder: (context, rowNumber) {
        return new FlatButton(

          onPressed: () {//Each rowNumber keeps track of a button in the ListView.
            if (rowNumber == 0) {
              print("Playing story A");
              _pauseTracker[0] = _pauseTracker[0] + 1;
              if(_pauseTracker[0]%2 == 0){ //If user clicks on a row an even number of times then they must wish to stop playing the recording. Clicks tracked in array 'pauseTracker'.
                _borderColors = [Colors.white, Colors.white, Colors.white]; //In this scenario we indicate the recording has stopped playing by deselecting the row. (Setting back to white)
              }
              else{
                _borderColors = [Colors.blue, Colors.white, Colors.white];
              }
            }
            else if (rowNumber == 1) {
              print("Playing story B");
              _pauseTracker[0] = _pauseTracker[1] + 1;
              if(_pauseTracker[1]%2 == 0){
                _borderColors = [Colors.white, Colors.white, Colors.white];
              }
              else{
                _borderColors = [Colors.white, Colors.blue, Colors.white];

              }
            }

            else if(rowNumber == 2){
              print("Playing story C");
              _pauseTracker[0] = _pauseTracker[2] + 1;
              if(_pauseTracker[2]%2 == 0){
                _borderColors = [Colors.white, Colors.white, Colors.white];
              }
              else{
                _borderColors = [Colors.white, Colors.white, Colors.blue];
              }
            }
          },
          child: new Column(
            children: <Widget>[
              new Tooltip(
                child: new Container(
                    padding: new EdgeInsets.all(14.0),
                    child: new Column(children: <Widget>[
                      new Container(
                          decoration: new BoxDecoration(
                              border: new Border.all(
                                  color: _borderColors[rowNumber])),
                          child: Image.network(
                            _images[rowNumber],
                            width: 400.0,
                            height: 200.0,
                          )),
                      new Icon(
                        Icons.play_circle_filled,

                      ),
                      new Text(_titles[rowNumber],
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
