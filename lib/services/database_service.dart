import 'dart:core';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:trump_machine/models/DBQuote.dart';

final String tableDBQuote = 'favorite_DBQuotes';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnContent = 'quote';
final String columnDone = 'done';

class DBQuoteProvider {
  DBQuoteProvider._();
  static final DBQuoteProvider db = DBQuoteProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "dumbest.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE DBQuote ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "content TEXT,"
          "blocked BIT"
          ")");
    });
  }

  newQuote(DBQuote newQuote) async {
    final db = await database;
    var res = await db.insert("DBQuote", newQuote.toJson());
    return res;
  }

  getFavoriteList() async {
    final db = await database;
    var res = await db.query("DBQuote");
    List<DBQuote> list =
        res.isNotEmpty ? res.map((q) => DBQuote.fromJson(q)).toList() : [];
    if (list.isNotEmpty && list != null) {
      print('I have data');
    }
    return list;
  }

  deleteQuote(int id) async {
    final db = await database;
    db.delete("Quote", where: "id = ?", whereArgs: [id]);
  }

  Future close() async => db.close();
}
