import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class DatabaseInvitation {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(""" CREATE TABLE invitation(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT,
    url TEXT,
    themeId INTEGER
    )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('galakita.db', version: 2,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  // Create new item
  static Future<int> createItem(String? title, String? url, int themeId) async {
    final db = await DatabaseInvitation.db();

    final data = {'title': title, 'url': url,'themeId':themeId};
    final id = await db.insert('invitation', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  //create all item
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DatabaseInvitation.db();
    return db.query('invitation', orderBy: 'id');
  }

  //get data
  static Future<List<Map<String, dynamic>>> getItem(int id, int themeId) async {
    final db = await DatabaseInvitation.db();
    return db.query('invitation', where: "id=?" , whereArgs: [id, themeId], limit: 1);
  }


  //update data
  static Future<int> updateItem(int id, String? title, String? url, int themeId) async {
    final db = await DatabaseInvitation.db();
    final data = {
      'title': title,
      'url': url,
      'themeId': themeId,
    };
    final result =
        await db.update('invitation', data, where: 'id', whereArgs: [id]);
    return result;
  }


//  delete data
  static Future<void> deleteItem(int id) async {
    final db = await DatabaseInvitation.db();
    try {
      await db.delete("invitation", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static void history() async {
    final database = await openDatabase('galakita.db');

    final tableName = "invitation";

    final tableInfo = await database.rawQuery('PRAGMA table_info($tableName)');

    for (var row in tableInfo) {
      print(row);
    }
  }
}
