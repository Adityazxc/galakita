import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseDetailInvitation {
  // static Future<void> createTables(sql.Database database) async {
  //   print("Creating tables...");
  //   await database.execute("""CREATE TABLE detailInvitation(
  //     id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  //     mempelaiPria TEXT,
  //     mempelaiWanita TEXT,
  //     weddingLocation TEXT,
  //     weddingDate TEXT,
  //     loveStory TEXT,
  //     quote TEXT,
  //     eventStartTime TEXT,
  //     eventTimeEnds TEXT
  //   )""");
  //   print("Tables created successfully");
  // }
  static Future<void> createTables(sql.Database database) async {
    print("Creating tables...");
    await database.execute("""CREATE TABLE detailInvitation(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      mempelaiPria TEXT,
      mempelaiWanita TEXT,
      weddingLocation TEXT,
      weddingDate TEXT,
      loveStory TEXT,
      quote TEXT,
      eventStartTime TEXT,
      eventTimeEnds TEXT
    )
    """);
    print("Tables created successfully");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('galakita1.db', version: 2,
        onCreate: (sql.Database database, int version) async {
      await DatabaseDetailInvitation.createTables(database);
    });
  }

// Create new item
  static Future<int> createItem(
    String? mempelaiPria,
    String? mempelaiWanita,
    String? weddingLocation,
    String? weddingDate,
    String? loveStory,
    String? quote,
    String? eventStartTime,
    String? eventTimeEnds,
  ) async {
    final db = await DatabaseDetailInvitation.db();

    final data = {
      'mempelaiPria': mempelaiPria,
      'mempelaiWanita': mempelaiWanita,
      'weddingLocation': weddingLocation,
      'weddingDate': weddingDate,
      'loveStory': loveStory,
      'quote': quote,
      'eventStartTime': eventStartTime,
      'eventTimeEnds': eventTimeEnds,
    };
    final id = await db.insert('detailInvitation', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  //create all item
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DatabaseDetailInvitation.db();
    return db.query('detailInvitation', orderBy: 'id');
  }

  //get data
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DatabaseDetailInvitation.db();
    return db.query('detailInvitation',
        where: "id=?", whereArgs: [id], limit: 1);
  }

  // Create new item
  static Future<int> updateItem(
    int id,
    String? mempelaiPria,
    String? mempelaiWanita,
    String? weddingLocation,
    // String? weddingDate,
    // String? loveStory,
    // String? quote,
    // String? eventStartTime,
    // String? eventTimeEnds,
  ) async {
    final db = await DatabaseDetailInvitation.db();

    final data = {
      'mempelaiPria': mempelaiPria,
      'mempelaiWanita': mempelaiWanita,
      'weddingLocation': weddingLocation,
      // 'weddingDate': weddingDate,
      // 'loveStory': loveStory,
      // 'quote': quote,
      // 'eventStartTime': eventStartTime,
      // 'eventTimeEnds': eventTimeEnds,
    };
    final result =
        await db.update('detailInvitation', data, where: 'id', whereArgs: [id]);
    return result;
  }

  //  delete data
  static Future<void> deleteItem(int id) async {
    final db = await DatabaseDetailInvitation.db();
    try {
      await db.delete("detailInvitation", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
