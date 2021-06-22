import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Quiz: De Hoge Komma'),
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
  int nummer = 0;
  int score = 0;

  List<String> vragen = [
    'Ik heet Nikki van Braam.',
    'Ik ben mannelijk.',
    'Ik heb geen broertjes of zusjes.',
    'Ik ben 19 jaar oud.',
    'Ik heb mijn rijbewijs al.',
    'Ik eet geen vlees.',
    'Ik ben single',
    'Mijn lievelingskleur is groen.',
    'Ik eet graag patat.',
    'Ik ben tweetalig.'
  ];
  List<bool> antwoorden = [
    true,
    false,
    false,
    true,
    false,
    true,
    false,
    false,
    true,
    true
  ];

  void volgendeVraag(){
    if(nummer < 9) {
      nummer++;
    } else {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Uw score is: $score",);
      nummer = 0;
      score = 0;
    }
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ///TODO score laten bijhouden
              //2 methodes aanmaken, een voor juist en een voor onjuist.
              //if(gekozen = 'juist'){score++};
              Text(
                'Stelling:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                vragen[nummer],
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: () {
                          bool gegevenAntwoord =  antwoorden[nummer];
                          if(gegevenAntwoord == true) {
                            score++;
                            print('antwoord was correct');
                          } else {
                            print('antwoord was niet correct');
                          }
                          setState(() {
                            volgendeVraag();
                          });
                        },
                        child: const Text(
                          'Juist',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: () {
                          bool gegevenAntwoord =  antwoorden[nummer];
                          if(gegevenAntwoord == false) {
                            score++;
                            print('antwoord was correct');
                          } else {
                            print('antwoord was niet correct');
                          }
                          setState(() {
                            volgendeVraag();
                          });
                        },
                        child: const Text(
                          'Onjuist',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Uw score is: $score',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
