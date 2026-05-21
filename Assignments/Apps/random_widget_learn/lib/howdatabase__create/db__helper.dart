import 'dart:io' as io;

import 'package:path_provider/path_provider.dart';
import 'package:random_widget_learn/howdatabase__create/databasemodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  Database? _database;
  final String tablename = 'product';
  final String idtable = 'number';
  final String producttable = 'productname';
  final String rupeestable = 'rupees';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'product.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tablename (
        $idtable INTEGER PRIMARY KEY AUTOINCREMENT,
        $producttable TEXT,
        $rupeestable REAL
      )
    ''');
  }

  Future<void> insertProduct(Product product) async {
    final db = await database;
    await db.insert(
      tablename,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateProduct(Product product) async {
    final db = await database;
    await db.update(
      tablename,
      product.toMap(),
      where: '$idtable = ?',
      whereArgs: [product.number],
    );
  }

  Future<List<Product>> getall() async {
    final db = await database;
    final result = await db.query(tablename);
    return result.map(((map) => Product.fromJson(map))).toList();
  }

  Future<String> deleteproduct(Product product) async {
    try {
      final db = await database;
      await db.delete(
        tablename,
        where: '$idtable = ?',
        whereArgs: [product.number],
      );
      return 'Delete Successfully';
    } catch (e) {
      return e.toString();
    }
  }
}
