import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> tapNote = [0,0,0,0,0,0,0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Xylophone'),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: setBar(Colors.red, 1),
              ),
              Expanded(
                child: setBar(Colors.orange, 2),
              ),
              Expanded(
                child: setBar(Colors.yellow, 3),
              ),
              Expanded(
                child: setBar(Colors.green, 4),
              ),
              Expanded(
                child: setBar(Colors.blue, 5),
              ),
              Expanded(
                child: setBar(Colors.indigo, 6),
              ),
              Expanded(
                child: setBar(Colors.deepPurple, 7),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget setBar(Color color, int note) {
    return Center(
      child: GestureDetector(
        onTapDown: (TapDownDetails details) {
          final player = AudioCache();
          player.play('note' + note.toString() + '.wav');
          setState(() {
            tapNote[note - 1] = 1;
          });
        },
        onTapUp: (TapUpDetails details) {
          setState(() {
            tapNote[note - 1] = 2;
          });
        },
        onTapCancel: () {
          setState(() {
            tapNote[note - 1] = 2;
          });
        },
        child: Container(
          width: double.infinity,
          color: (tapNote[note - 1].isOdd ? color.withOpacity(0.5) : color.withOpacity(1))

        ),
      ),
    );
  }
}
