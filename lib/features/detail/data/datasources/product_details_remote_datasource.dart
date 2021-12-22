import 'package:http/http.dart' as http;
import 'package:mobileshop/core/error/exception.dart';
import 'package:mobileshop/features/detail/data/models/product_details_model.dart';
import 'dart:convert';

import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<List<ProductDetailsModel>> getProductDetails(String path);
}

class ProductDetailsDataSourceImpl implements ProductDetailsRemoteDataSource {
  final http.Client client;

  ProductDetailsDataSourceImpl({required this.client});

  @override
  Future<List<ProductDetailsModel>> getProductDetails(String path) =>
      _getProductDetailsFromUrl('https://db2021ecom-edca.restdb.io/rest/$path');

  Future<List<ProductDetailsModel>> _getProductDetailsFromUrl(
      String url) async {
    final response = await client.get(Uri.parse(url),
        headers: {'x-apikey': '2aa8e910f6c4ade81a84c9333ffc7bf6a398e'});

    if (response.statusCode == 200) {
      List<dynamic> items = json.decode(response.body);
      return items.map((json) => ProductDetailsModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
