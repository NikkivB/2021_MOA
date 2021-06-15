import 'package:flutter/material.dart';
import 'package:opdracht5a/helpers/shared_prefs_utils.dart';
import 'package:opdracht5a/wiealm.dart';
import 'onematch.dart';

class WieAlm extends StatefulWidget {
  WieAlm({this.chosenTeam = 0});
  var chosenTeam;

  @override
  _WieAlmState createState() => _WieAlmState();
}

class _WieAlmState extends State<WieAlm> {
  var chosenMatch = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(children: <Widget>[
              //Title for all sets
              Text(
                "Wierden - Almelo",
                style: const TextStyle(fontSize: 30),
              ),

              //All matches are in a list, they are buttons
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                  onPressed: () {
                  chosenMatch = "ve1";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OneMatch(
                        ),
                    ),
                  );
                  },
                    child: const Text('Vrouwen enkel 1'),
                    ),
                    TextButton(
                    style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    ),
                      onPressed: () {
                        //widget.chosenMatch = "ve2";
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OneMatch(
                            ),
                          ),
                        );
                      },
                    child: const Text('Vrouwen enkel 2'),

                    ),
                    TextButton(
                    style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    ),
                      onPressed: () {
                        //widget.chosenMatch = "me1";
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OneMatch(
                            ),
                          ),
                        );
                      },
                    child: const Text('Mannen enkel 1'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  //widget.chosenMatch = "me2";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OneMatch(
                      ),
                    ),
                  );
                },
                child: const Text('Mannen enkel 2'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  //.chosenMatch = "vd";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OneMatch(
                      ),
                    ),
                  );
                },
                child: const Text('Vrouwen dubbel'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  //widget.chosenMatch = "md";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OneMatch(
                      ),
                    ),
                  );
                },
                child: const Text('Mannen dubbel'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  //widget.chosenMatch = "mid1";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OneMatch(
                      ),
                    ),
                  );
                },
                child: const Text('Mix dubbel 1'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  //widget.chosenMatch = "mid2";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OneMatch(
                      ),
                    ),
                  );
                },
                child: const Text('Mix dubbel 2'),
              ),
            ]),

            //The end of all matches, the reset and save buttons are here.
          ),
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
      ),
    );
  }
}
