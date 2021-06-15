import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Registratie Systeem',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //controllers used in insert operation UI
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController classController = TextEditingController();

  //controllers used in update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController classUpdateController = TextEditingController();

  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();

  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showMessageInScaffold(String message) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Nieuw",
              ),
              Tab(
                text: "Lijst",
              ),
              Tab(
                text: "Zoek",
              ),
              Tab(
                text: "Wijzig",
              ),
              Tab(
                text: "Wis",
              ),
            ],
          ),
          title: Text('Studenten - Flutter SQLite Tutorial'),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: idController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Studentnummer',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Naam',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: classController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Klas',
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text('Toevoegen'),
                    onPressed: () {
                      //TODO: Nieuwe student toevoegen
                    },
                  ),
                ],
              ),
            ),
            Container(
                //TODO: Overzicht alle studenten
                child: Text('Alle studenten')),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Studentnummer',
                      ),
                      onChanged: (text) {
                        if (text.length >= 1) {
                          setState(() {
                            //TODO: Studentgegevens ophalen
                          });
                        } else {
                          setState(() {
                            //TODO: Lijst leegmaken
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: idUpdateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Studentnummer',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: nameUpdateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Naam',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: classUpdateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Klas',
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text('Studentgegevens wijzigen'),
                    onPressed: () {
                      //TODO: Wijzigingen opslaan
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: idDeleteController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Studentnummer',
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text('Wis'),
                    onPressed: () {
                      int id = int.parse(idDeleteController.text);
                      //TODO: Verwijderen
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
