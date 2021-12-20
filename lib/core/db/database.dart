import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  late Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();

    String path = dir.path + 'MobileShop.db';
    return await openDatabase(path, version: 1);
  }

  void _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE HomeStoreTable(id INTEGER PRIMARY KEY AUTOINCREMENT, images TEXT, )',
    );
    await db.execute(
      'CREATE TABLE BestSellerTable(id INTEGER PRIMARY KEY AUTOINCREMENT,  TEXT)',
    );
    await db.execute(
      'CREATE TABLE DetailsTable(id INTEGER PRIMARY KEY AUTOINCREMENT,  TEXT)',
    );
    await db.execute(
      'CREATE TABLE BasketTable(id INTEGER PRIMARY KEY AUTOINCREMENT,  TEXT)',
    );
  }
}
