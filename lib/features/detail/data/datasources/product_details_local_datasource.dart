import 'package:mobileshop/core/db/database_consts.dart';
import 'package:mobileshop/features/detail/data/models/product_details_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class ProductDetailsLocalDataSource {
  Future<ProductDetailsModel> readDetail();
  void insertDetail(ProductDetailsModel productDetails);
}

class ProductDetailsLocalDataSourceImpl
    implements ProductDetailsLocalDataSource {
  Database db;
  ProductDetailsLocalDataSourceImpl({
    required this.db,
  });

  @override
  void insertDetail(ProductDetailsModel productDetails) async {
    await db.insert(detailTable, productDetails.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    for (var imageUrl in productDetails.images) {
      await db.insert(
          detailImagesTable,
          {
            detailImagesID: 11045 + productDetails.images.indexOf(imageUrl),
            detailImagesUrl: imageUrl
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    for (var colorValue in productDetails.color) {
      await db.insert(
          detailColorsTable,
          {
            detailColorID: 9000 + productDetails.color.indexOf(colorValue),
            detailColorValue: colorValue
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    for (var capacityValue in productDetails.capacity) {
      await db.insert(
          detailCapacityTable,
          {
            detailCapacityID:
                9200 + productDetails.capacity.indexOf(capacityValue),
            detailCapacityValue: capacityValue
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  @override
  Future<ProductDetailsModel> readDetail() async {
    List<String> images = [];
    var imagesMaps = await db.query(detailImagesTable);
    for (var imageMap in imagesMaps) {
      images.add(
        imageMap[detailImagesUrl] as String,
      );
    }

    List<String> colors = [];
    var colorsMaps = await db.query(detailColorsTable);
    for (var colorMap in colorsMaps) {
      colors.add(
        colorMap[detailColorValue] as String,
      );
    }
    List<String> capacity = [];
    var capacityMaps = await db.query(detailCapacityTable);
    for (var capacityMap in capacityMaps) {
      capacity.add(
        capacityMap[detailCapacityValue] as String,
      );
    }

    var detailsMap = await db.query(detailTable);
    return ProductDetailsModel(
        id: detailsMap[0][detailID],
        images: images,
        is_favorites: detailsMap[0][detailIsFavorites] == 1 ? true : false,
        title: detailsMap[0][detailTitle],
        rating: double.parse(detailsMap[0][detailRating] as String),
        cpu: detailsMap[0][detailCpu],
        camera: detailsMap[0][detailCamera],
        ssd: detailsMap[0][detailSsd],
        sd: detailsMap[0][detailSd],
        color: colors,
        capacity: capacity,
        price: detailsMap[0][detailPrice]);
  }
}
