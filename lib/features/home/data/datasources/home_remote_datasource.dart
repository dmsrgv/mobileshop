import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mobileshop/core/error/exception.dart';
import 'package:mobileshop/features/home/data/models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<dynamic>> getAllItems(String path);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<HomeModel>> getAllItems(String path) =>
      _getItemsFromUrl('https://db2021ecom-edca.restdb.io/rest/$path');

  Future<List<HomeModel>> _getItemsFromUrl(String url) async {
    final response = await client.get(Uri.parse(url),
        headers: {'x-apikey': '2aa8e910f6c4ade81a84c9333ffc7bf6a398e'});

    if (response.statusCode == 200) {
      List<dynamic> items = json.decode(response.body);
      return items.map((json) => HomeModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
