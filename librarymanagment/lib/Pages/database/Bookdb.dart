// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:librarymanagment/Pages/database/book.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class BookDb {
  static const _dbName = 'library_database.db';
  static const _tableName = 'book_table';

  static Future<Database> _database() async {
    sqfliteFfiInit();
    final dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, _dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, book TEXT NOT NULL, author TEXT, photo TEXT,year TEXT,read TEXT,count TEXT,information TEXT,time TEXT)', // Ensure 'createAt' is NOT NULL
        );
      },
      version: 1,
    );
  }

  static Future<void> insert({required Book book}) async {
    try {
      final db = await _database();
      await db.insert(
        _tableName,
        book.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (error) {
      if (kDebugMode) {
        if (kDebugMode) {
          print('Error inserting note: $error');
        }
      }
    }
  }

  static Future<List<Book>> getBook() async {
    final db = await _database();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      if (kDebugMode) {
        print(maps[i]);
      }
      return Book(
        id: maps[i]['id'] as int,
        book: maps[i]['book'] as String,
        author: maps[i]['author'] as String,
        photo: maps[i]['photo'] as String,
        year: maps[i]['year'] as String,
        read: maps[i]['read'] as String,
        count: maps[i]['count'] as String,
        information: maps[i]['information'] as String,
        time: DateTime.parse(maps[i]['time']),
      );
    });
  }
 static Future<void> delete({required Book book}) async {
  final db = await _database();
  await db.delete(
    _tableName,
    where: 'id = ?',
    whereArgs: [book.id],
  );
}
static update({required Book book}) async {
    final db = await _database();
    await db.update(_tableName, book.toMap(),
        where: 'id = ?', whereArgs: [book.id]);
  }
}
