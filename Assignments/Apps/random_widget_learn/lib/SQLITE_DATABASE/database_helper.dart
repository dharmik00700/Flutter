import 'dart:async';
import 'dart:core';
import 'package:random_widget_learn/SQLITE_DATABASE/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  Database? _database;
  final String table = 'mytable';
  final String colId = 'id';
  final String colName = 'name';
  final String colAge = 'age';

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initializedatabase();
    return _database;
  }

  Future<Database?> initializedatabase() async {
    final directory = await getDatabasesPath();
    final path = join(directory, 'myseconddatabase.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE $table ($colId INTEGER PRIMARY KEY, $colName TEXT, $colAge INTEGER)''',
        );
      },
    );
  }

  Future<void> insertdata(UserModel model) async {
    final database = await this.database;
    await database!.insert(table, model.tomap());
  }

  Future<List<UserModel>> readdata() async {
    final database = await this.database;
    List<Map<String, dynamic>> data = await database!.query(table);
    return List.generate(data.length, (map) => UserModel.fromJson(data[map]));
  }

  Future<void> deletedata(int idValue) async {
    final db = await this.database;
    await db!.delete(table, where: '$colId = ?', whereArgs: [idValue]);
  }

  Future<void> updatedata(UserModel model) async {
    final database = await this.database;
    await database!.update(
      table,
      model.tomap(),
      where: '$colId = ?',
      whereArgs: [model.id],
    );
  }
}
