import 'package:flutter/material.dart';
import 'student.dart';
import 'dbhelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Registratie Systeem',
      theme: ThemeData(
        primarySwatch: Colors.teal,
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
  final dbHelper = DatabaseHelper.instance;

  List<Student> students = [];
  List<Student> studentByClass = [];

  //Insert the new student into the database
  void _insert(studentnr, name, studentClass) async {
    //row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: studentnr,
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnClass: studentClass
    };
    Student student = Student.fromMap(row);
    try {
      final id = await dbHelper.insert(student);
      _showMessageInScaffold('Student $name toegevoegd');
    } catch (e) {
      _showMessageInScaffold('Studentnummer $studentnr bestaat al');
    }
  }

  //Clears all textboxes
  void clearTextboxes() {
    idController.text = '';
    nameController.text = '';
    classController.text = '';
  }

  //gets all students
  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    students.clear();
    allRows.forEach((row) => students.add(Student.fromMap(row)));
    _showMessageInScaffold('Aantal studenten: ${students.length}.');
  }

  //Filter students by studentnummer
  void _query(studentClass) async {
    final allRows = await dbHelper.queryRows(studentClass);
    studentByClass.clear();
    allRows.forEach((row) => studentByClass.add(Student.fromMap(row)));
  }

  void _update(studentnr, name, studentClass) async {
    //row to update
    Student student =
        Student(studentnr: studentnr, naam: name, klas: studentClass);
    final rowsAffected = await dbHelper.update(student);
    _showMessageInScaffold('$rowsAffected student(en) aangepast');
  }

  void _delete(studentnr) async {
    final rowsDeleted = await dbHelper.delete(studentnr);
    if (rowsDeleted == 0) {
      _showMessageInScaffold('Student $studentnr niet gevonden');
    } else {
      _showMessageInScaffold('Verwijderd student: $studentnr');
    }
  }

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
              child: SingleChildScrollView(
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
                        setState(() {
                          _insert(idController.text, nameController.text,
                              classController.text);
                          clearTextboxes();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //TODO: Overzicht alle studenten
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: students.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == students.length) {
                      return IconButton(
                        icon: Icon(Icons.refresh),
                        iconSize: 24.0,
                        onPressed: () {
                          setState(() {
                            _queryAll();
                          });
                        },
                      );
                    }
                    return Container(
                        height: 40,
                        child: Center(
                            child: Text(
                          '${students[index].studentnr} (${students[index].naam}) - ${students[index]}',
                          style: TextStyle(fontSize: 18),
                        )));
                  }),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'KLAS',
                      ),
                      onChanged: (text) {
                        if (text.length >= 1) {
                          setState(() {
                            //TODO: Studentgegevens ophalen
                            _query(text);
                          });
                        } else {
                          setState(() {
                            //TODO: Lijst leegmaken
                            studentByClass.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: studentByClass.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              '${studentByClass[index].studentnr} - (${studentByClass[index].naam})',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        );
                      },
                    ),
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
                      _update(
                          idUpdateController.text,
                          nameUpdateController.text,
                          classUpdateController.text);
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
                      _delete(idDeleteController.text);
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
