import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const tablGroceryItem = 'grocery_item';
const dbId = 'id';
const dbName = 'name';
const dbQuantity = 'quantity';
const dbCategory = 'category';

Future<Database> initializationDatabase() async {
  final dbpath = await getDatabasesPath();
  String path = join(dbpath, 'newgrocery.db');
  print('Database path: $dbpath');
  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) {
      db.execute(
        "CREATE TABLE $tablGroceryItem ($dbId INTEGER PRIMARY KEY AUTOINCREMENT,$dbName TEXT,$dbQuantity INTEGER,$dbCategory TEXT)",
      );
    },
  );
}
