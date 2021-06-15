import 'package:flutter/material.dart';
import 'package:opdracht5a/helpers/shared_prefs_utils.dart';
import 'package:opdracht5a/wiealm.dart';

class OneMatch extends StatefulWidget {
  @override
  _OneMatchState createState() => _OneMatchState();
}

class _OneMatchState extends State<OneMatch> {
  int scoreT1 = 0;
  int scoreT2 = 0;
  int setsT1 = 0;
  int setsT2 = 0;
  var team1 = "";
  var team2 = "";

  void ChangeScoreT1() {
    if (scoreT1 == 21) {
      setsT1 = setsT1 + 1;
      scoreT1 = 0;
      scoreT2 = 0;
    } else {
      scoreT1 = scoreT1 + 1;
    }
  }

  void ChangeScoreT2() {
    if (scoreT2 == 21) {
      setsT2 = setsT2 + 1;
      scoreT1 = 0;
      scoreT2 = 0;
    } else {
      scoreT2 = scoreT2 + 1;
    }
  }

  void saveChanges() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(30.0),
                  child: Image(image: AssetImage("images/ALM.jpg")),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(30.0),
                  child: Image(image: AssetImage("images/WIE.jpg")),
                ),
              ),
            ]),

            Text("Sets"),

            Row(children: <Widget>[
              //Title for all sets
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: Text(setsT1.toString()),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: Text(setsT2.toString()),
                  ),
                ),
              ),
            ]),

            Text("Deze set"),

            //start reset/save button
            Row(children: <Widget>[
              //Title for all sets
              //All matches are in a list, they are buttons
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 70),
                    ),
                    onPressed: () {
                      setState(() {
                        ChangeScoreT1();
                      });
                    },
                    child: Text(scoreT1.toString()),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 70),
                    ),
                    onPressed: () {
                      setState(() {
                        ChangeScoreT2();
                      });
                    },
                    child: Text(scoreT2.toString()),
                  ),
                ),
              ),
            ]),

            Row(children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text("Reset"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text("Save"),
                  ),
                ),
              ),
            ]),
          ],
        ));
  }
}
