// lib/db/notes_db.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../models/note.dart';

class NotesDB {
  static final NotesDB instance = NotesDB._init();
  static Database? _database;

  NotesDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('mynotes.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE notes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      description TEXT NOT NULL,
      created_at TEXT NOT NULL
    )
    ''');
  }

  Future<Note> createNote(Note note) async {
    final db = await instance.database;
    final id = await db.insert('notes', note.toMap());
    return note.copyWith(id: id);
  }

  Future<Note?> readNote(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'notes',
      columns: ['id', 'title', 'description', 'created_at'],
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Note.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = 'created_at DESC';
    final result = await db.query('notes', orderBy: orderBy);
    return result.map((json) => Note.fromMap(json)).toList();
  }

  Future<int> updateNote(Note note) async {
    final db = await instance.database;
    return db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
