import 'package:mobileshop/core/db/database_consts.dart';
import 'package:mobileshop/features/home/data/models/bestseller_model.dart';
import 'package:mobileshop/features/home/data/models/homestore_model.dart';
import 'package:mobileshop/features/home/domain/entities/homestore_entity.dart';
import 'package:sqflite/sqflite.dart';

import 'package:mobileshop/features/home/data/models/home_model.dart';

abstract class HomeLocalDataSource {
  Future<dynamic> readHome();
  void insertHome(HomeModel home);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  Database db;
  HomeLocalDataSourceImpl({
    required this.db,
  });

  @override
  Future<HomeModel> readHome() async {
    //var database = db;
    List<HomeStoreModel> homeStore = [];
    List<BestSellerModel> bestSeller = [];

    var homeStoreMap = await db.query(homeStoreTable);
    for (var homeStoreItem in homeStoreMap) {
      homeStore.add(HomeStoreModel(
          id: homeStoreItem[homeStoreID],
          is_new: homeStoreItem[homeStoreIsNew] == 1 ? true : false,
          is_favorites: homeStoreItem[homeStoreIsFavorites] == 1 ? true : false,
          title: homeStoreItem[homeStoreTitle],
          subtitle: homeStoreItem[homeStoreSubTitle],
          picture: homeStoreItem[homeStorePicture],
          is_buy: homeStoreItem[homeStoreIsBuy] == 1 ? true : false));
    }

    var bestSellerMap = await db.query(bestSellerTable);
    for (var bestSellerItem in bestSellerMap) {
      bestSeller.add(BestSellerModel(
          id: bestSellerItem[bestSellerID],
          is_favorites:
              bestSellerItem[bestSellerIsFavorites] == 1 ? true : false,
          title: bestSellerItem[bestSellerTitle],
          price_without_discount:
              bestSellerItem[bestSellerPriceWithoutDiscount],
          discount_price: bestSellerItem[bestSellerDiscountPrice],
          picture: bestSellerItem[bestSellerPicture]));
    }

    var homeMaps = await db.query(homeTable);
    return HomeModel(
        id: homeMaps[0][keyHome], homeStore: homeStore, bestSeller: bestSeller);
  }

  @override
  void insertHome(HomeModel home) async {
    var database = db;
    await database.insert(
      homeTable,
      {homeID: 110700, keyHome: home.id},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    for (var homeStoreItem in home.homeStore) {
      await database.insert(homeStoreTable, homeStoreItem.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    for (var bestSellerItem in home.bestSeller) {
      await database.insert(bestSellerTable, bestSellerItem.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }
}
