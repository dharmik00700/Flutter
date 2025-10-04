import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
const db_table_user_palces = "user_places";
const db_id = "id";
const db_title = "title";
const db_image = "image";
const db_lat = "lat";
const db_lng = "lng";
const db_address = "address";

Future<Database> getdatabase() async {
  final dbpath = await getDatabasesPath();
  final db = await openDatabase(
    path.join(dbpath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE $db_table_user_palces($db_id TEXT PRIMARY KEY, $db_title TEXT, $db_image TEXT, $db_lat REAL, $db_lng REAL, $db_address TEXT)",
      );
    },version: 1
  );
  return db;
}
