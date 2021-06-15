import 'dbhelper.dart';

class Student {
  String studentnr = '';
  String naam = '';
  String klas = '';

  Student({required this.studentnr, required this.naam, required this.klas});

  Student.fromMap(Map<String, dynamic> map) {
    //id = map['id']
    studentnr = map['studentnr'];
    naam = map['naam'];
    klas = map['klas'];
  }
  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.ColumnId: studentnr,
      DatabaseHelper.ColumnName: naam,
      DatabaseHelper.ColumnClass: klas,
    };
  }
}