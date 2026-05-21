import 'package:projectforlearn/database/database_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class databasehelper {
  Database? _database;
  final String tablename = "mytable";
  final String idtable = "id";
  final String nametable = "name";
  final String numbertable = "number";

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    String path = join(await getDatabasesPath(), 'hello.db');
    _database = await openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE $tablename(
        $idtable INTEGER PRIMARY KEY AUTOINCREMENT,
        $nametable TEXT,
        $numbertable INTEGER
        )
      ''');
      },
      version: 1,
    );
    return _database;
  }

  Future<void> insert(modeldatabase model) async {
    Database? db = await database;
    db!.insert(tablename, model.tomap());
  }

  Future<void> update(modeldatabase model) async {
    Database? db = await database;
    db!.update(
      tablename,
      model.tomap(),
      where: '$idtable = ?',
      whereArgs: [model.id],
    );
  }

  Future<List<modeldatabase>> read() async {
    Database? db = await database;
    List<Map<String, dynamic>> maps = await db!.query(tablename);
    return maps.map((e) => modeldatabase.fromMap(e)).toList();
  }

  Future<void> delete(int id) async {
    Database? db = await database;
    db!.delete(tablename, where: '$idtable = ?', whereArgs: [id]);
  }
}
