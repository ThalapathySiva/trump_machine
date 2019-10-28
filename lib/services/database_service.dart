import 'dart:core';

import 'package:sqflite/sqflite.dart';

final String tableDBQuote = 'favorite_DBQuotes';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnContent = 'quote';
final String columnDone = 'done';

class DBQuote {
  int id;
  String title;
  String content;
  bool done;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: title,
      columnContent: content,
      columnDone: done == true ? 1 : 0
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  DBQuote({
    this.title,
    this.content,
    this.id,
  });

  DBQuote.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    content = map[columnContent];
    done = map[columnDone] == 1;
  }
}

class DBQuoteProvider {
  Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableDBQuote ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnContent text not null,
  $columnDone integer not null)
''');
    });
  }

  Future<DBQuote> insert(DBQuote dBQuote) async {
    dBQuote.id = await db.insert(tableDBQuote, dBQuote.toMap());
    return dBQuote;
  }

  Future<DBQuote> getDBQuote(String title) async {
    List<Map> maps = await db.query(tableDBQuote,
        columns: [columnId, columnDone, columnTitle, columnContent],
        where: '$columnTitle = ?',
        whereArgs: [title]);
    if (maps.length > 0) {
      return DBQuote.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(String title) async {
    return await db
        .delete(tableDBQuote, where: '$columnTitle = ?', whereArgs: [title]);
  }

  Future<int> update(DBQuote dBQuote) async {
    return await db.update(tableDBQuote, dBQuote.toMap(),
        where: '$columnTitle = ?', whereArgs: [dBQuote.title]);
  }

  Future close() async => db.close();
}
