import 'student.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "student.dbo";
  static final _databaseVersion = 1;
  static final table = 'students_table';
  static final columnId = 'studentnr';
  static final columnName = 'naam';
  static final columnClass = 'klas';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
    version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $table (
      $columnId TEXT PRIMARY KEY,
      $columnName TEXT NOT NULL,
      $columnClass TEXT NOT NULL
    )'''
        );
  }
  Future<int> insert(Student student) async {
    Database? db = await instance.database;
    int result = await db!.insert(table, {
      'studentnr' : student.studentnr,
      'naam' : student.naam,
      'klas' : student.klas
    });
    return result;
  }
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }
  Future<List<Map<String, dynamic>>> queryRows(studentClass) async {
    Database? db = await instance.database;
    return await db!.query(table, where: "$columnClass LIKE '%$studentClass%'");
  }
  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(
      await db!.rawQuery('SELECT COUNT(*) FROM $table')
    );
  }
  Future<int> update(Student student) async {
    Database? db = await instance.database;
    String studentnr = student.toMap()['studentnr'];
    return await db!.update(table, student.toMap(),
        where: '$columnId = ?', whereArgs: [studentnr]);
  }
  Future<int> delete(String studentnr) async {
    Database? db = await instance.database;
    return await db!
        .delete(table, where: '$columnId = ?', whereArgs: [studentnr]);
  }
  }
