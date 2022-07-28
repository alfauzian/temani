import 'dart:async';
import 'gizi_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

abstract class giziDB {
  static late Database _database;
  static int get _version => 1;

  static Future<void> init() async {
    try {
      String _path = await getDatabasesPath();
      String _databasePath = p.join(_path, 'gizi_db');

      _database = await openDatabase(_databasePath,
          version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static Future<void> onCreate(Database _database, int version) async {
    await _database.execute(
        'CREATE TABLE giziList (id INTEGER PRIMARY KEY NOT NULL, karbohidrat INTEGER, protein INTEGER, lemak INTEGER)');
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      await _database.query(table);

  static Future<int> insert(String table, GiziList giziList) async =>
      await _database.insert(table, giziList.toMap());
  
  static Future <int> delete(String table, GiziList giziList) async =>
      await _database.delete(table, where: 'id = ?', whereArgs: [giziList.id]);
}
