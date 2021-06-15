import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Magic 8 ball'),
          backgroundColor: Colors.black,
        ),
        body: Magic8ball(),
      ),
    ),
  );
}

class Magic8ball extends StatefulWidget {
  @override
  _Magic8ballState createState() => _Magic8ballState();
}

class _Magic8ballState extends State<Magic8ball> {
  int ballFace = 1;

  void changeBallFace() {
    ballFace = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    changeBallFace();
                  });
                },
                child: Image.asset('images/ball$ballFace.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
