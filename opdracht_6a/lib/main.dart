import 'package:flutter/material.dart';

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
  int _counter = 0;
  int _vraag = 0;
  String _voorstuk = 'klik op een van de knoppen om verder te gaan';
  String _heleVraag = '';
  int score = 0;

  void welkeVraag() {
    switch (_vraag) {
      case 0:
        {
          _voorstuk = 'stelling:';
          _heleVraag = 'Ik heet Nikki van Braam.';
        }
        break;
      case 1:
        {
          _heleVraag = 'Ik ben mannelijk.';
        }
        break;
      case 2:
        {
          _heleVraag = 'Ik heb geen broertjes of zusjes.';
        }
        break;
      case 3:
        {
          _heleVraag = 'Ik ben 19 jaar oud.';
        }
        break;
      case 4:
        {
          _heleVraag = 'Ik heb mijn rijbewijs al.';
        }
        break;
      case 5:
        {
          _heleVraag = 'Ik eet geen vlees.';
        }
        break;
      case 6:
        {
          _heleVraag = 'Ik ben single';
        }
        break;
      case 7:
        {
          _heleVraag = 'Mijn lievelingskleur is groen.';
        }
        break;
      case 8:
        {
          _heleVraag = 'Ik eet graag patat.';
        }
        break;
      case 9:
        {
          _heleVraag = 'Ik ben tweetalig.';
        }
        break;
    }
  }

  void volgendeVraag() {
    if(_vraag < 10) {
      _vraag++;
    }

  }

  void _juist() {
    if(_vraag == 0 || _vraag == 3 || _vraag == 5 || _vraag == 8 || _vraag == 9){
      score++;
    } else {
      score = score;
    }
  }

  void _onjuist() {
    if(_vraag == 1 || _vraag == 2 || _vraag == 4 || _vraag == 6 || _vraag == 7){
      score++;
    } else {
      score = score;
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
              Text('$_voorstuk',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                '$_heleVraag',
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
                          setState(() {
                            welkeVraag();
                            volgendeVraag();
                            _juist();
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
                          setState(() {
                            welkeVraag();
                            volgendeVraag();
                            _onjuist();
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
              Text('Uw score is: $score',
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
