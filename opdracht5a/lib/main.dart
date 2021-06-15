import 'package:flutter/material.dart';
import 'package:opdracht5a/wiealm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'ScoreKeeper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //#region sets
  var wieAlmSets = "" ;
  var henNijSets = "" ;
  var nijAlmSets = "" ;
  var henWieSets = "" ;

  var wieAlmRest = "" ;
  var henNijRest = "" ;
  var nijAlmRest = "" ;
  var henWieRest = "" ;
  var chosenTeams = "";
//#endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//#region wedstrijden
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)
                  )
              ),
            child: Column(children: <Widget>[

              //Title for all matches
              Text("Wedstrijden",
                  style: const TextStyle(fontSize: 30),
                ),

              //All matches are in a list, they are buttons
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  chosenTeams = "wieAlm";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WieAlm(
                      ),
                    ),
                  );
                },
                child: const Text('Wierden - Almelo'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  chosenTeams = "henNij";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WieAlm(
                      ),
                    ),
                  );
                },
                child: const Text('Hengelo - Nijverdal'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  chosenTeams = "nijAlm";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WieAlm(
                      ),
                    ),
                  );
                },
                child: const Text('Nijverdal - Almelo'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  chosenTeams = "henWie";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WieAlm(
                      ),
                    ),
                  );
                },
                child: const Text('Hengelo - Wierden'),
              ),
            ]),

            //The end of all matches, the reset and save buttons are here.
          ),
          //#endregion
          //region reset/save
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
          //endregion
        ],
      ),
    );
  }
}
