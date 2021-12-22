import 'dart:convert';

import 'package:mobileshop/core/error/exception.dart';
import 'package:mobileshop/features/cart/data/models/cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';

abstract class CartRemoteDataSource {
  Future<List<CartModel>> getCartItems(String path);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final http.Client client;

  CartRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CartModel>> getCartItems(String path) =>
      _getItemsFromUrl('https://db2021ecom-edca.restdb.io/rest/$path');

  Future<List<CartModel>> _getItemsFromUrl(String url) async {
    final response = await client.get(Uri.parse(url),
        headers: {'x-apikey': '2aa8e910f6c4ade81a84c9333ffc7bf6a398e'});

    if (response.statusCode == 200) {
      List<dynamic> items = json.decode(response.body);
      return items.map((json) => CartModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
