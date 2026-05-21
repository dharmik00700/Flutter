import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../modelclass/businessmodel.dart';

class databasehandler {
  Database? _database;
  final String business_name = 'businessname';
  final String businessman_name = 'businessmanname';
  final String business_detail = 'businessdetail';
  final String business_id = 'id';
  final String table_name = 'business';

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await intializeDatabase();
    return _database;
  }

  Future<Database> intializeDatabase() async {
    String dbpaths = await getDatabasesPath();
    String path = join(dbpaths, 'business.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          '''
      CREATE TABLE $table_name($business_name STRING,$businessman_name STRING,$business_detail STRING,$business_id INTEGER PRIMARY KEY)''',
        );
      },
    );
  }

  Future<void> addinformation(Businessmodel businessmodel) async {
    Database? dbs = await database;
    dbs!.insert(table_name, businessmodel.tomap());
  }

  Future<void> updateinformation(Businessmodel businessmodel) async {
    Database? dbs = await database;
    dbs?.update(
      table_name,
      businessmodel.tomap(),
      where: '$business_id = ?',
      whereArgs: [businessmodel.id],
    );
  }

  Future<List<Businessmodel>> readinformation() async {
    Database? dbs = await database;
    final List<Map<String, dynamic>> maps = await dbs!.query(table_name);
    return List.generate(
      maps.length,
      (index) => Businessmodel.frommap(maps[index]),
    );
  }

  Future<void> deletedata(int id) async {
    Database? dbs = await database;
    dbs?.delete(table_name, where: '$id = ?', whereArgs: [id]);
  }
}
