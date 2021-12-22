import 'dart:io';
import 'dart:async';
import 'package:mobileshop/core/db/database_consts.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "mobileshop5.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS $homeTable (
      $homeID $primaryKeyType,
      $keyHome $textType)
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $homeStoreTable (
      $homeStoreID $primaryKeyType,
      $homeStoreIsNew $intType,
      $homeStoreIsFavorites $intType,
      $homeStoreTitle $textType,
      $homeStoreSubTitle $textType,
      $homeStorePicture $textType,
      $homeStoreIsBuy $intType)
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $bestSellerTable (
      $bestSellerID $primaryKeyType,
      $bestSellerIsFavorites $intType,
      $bestSellerTitle $textType,
      $bestSellerPicture $textType,
      $bestSellerDiscountPrice $intType,
      $bestSellerPriceWithoutDiscount $intType)
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $detailTable (
      $detailID $primaryKeyType,
      $detailIsFavorites $intType,
      $detailTitle $textType,
      $detailRating $textType,
      $detailCpu $textType,
      $detailCamera $textType,
      $detailSsd $textType,
      $detailSd $textType,
      $detailPrice $intType)
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $detailImagesTable (
      $detailImagesID $primaryKeyType,
      $detailImagesUrl $textType)
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $detailColorsTable (
      $detailColorID $primaryKeyType,
      $detailColorValue $textType)
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $detailCapacityTable (
      $detailCapacityID $primaryKeyType,
      $detailCapacityValue $textType)
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $cartTable (
      $cartID $primaryKeyType,
      $cartTotal $intType,
      $cartDelivery $intType)
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $cartBasketTable (
      $cartBasketID $primaryKeyType,
      $cartBasketTitle $textType,
      $cartBasketImage $textType,
      $cartBasketPrice $intType)
    ''');
  }
}
