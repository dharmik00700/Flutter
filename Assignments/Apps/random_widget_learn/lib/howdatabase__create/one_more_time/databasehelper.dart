import 'package:random_widget_learn/howdatabase__create/one_more_time/accountmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseInstance {
  Database? _database;
  final String table = 'learndata';
  final String buy = 'buy';
  final String rupes = 'rupes';
  final String colId = 'id'; // Renamed from 'index' to avoid SQL keyword conflicts

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDatabase();
    return _database;
  }

  Future<Database?> _initializeDatabase() async {
    final directory = await getDatabasesPath();
    final path = join(directory, 'learndata.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $table($colId INTEGER PRIMARY KEY AUTOINCREMENT, $buy TEXT, $rupes INTEGER)
        ''');
      },
    );
  }

  Future<void> insert(Accountmodel model) async {
    final db = await database;
    // Ensure model.tomap() uses keys that match 'id', 'buy', and 'rupes'
    await db!.insert(table, model.tomap());
  }

  Future<List<Accountmodel>> readdata() async {
    final db = await database;
    List<Map<String, Object?>> listdata = await db!.query(table);
    return List.generate(
      listdata.length,
      (i) => Accountmodel.fromJson(listdata[i]),
    );
  }

  Future<int> update(Accountmodel model) async {
    final db = await database;
    return await db!.update(
      table,
      model.tomap(),
      where: '$colId = ?',
      whereArgs: [model.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db!.delete(table, where: '$colId = ?', whereArgs: [id]);
  }
}
