import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mobileshop/core/error/exception.dart';
import 'package:mobileshop/core/utils/rest_api.dart';
import 'package:mobileshop/features/home/data/models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeModel>> getAllItems(String path);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final RestClient client;

  HomeRemoteDataSourceImpl({required this.client});
  @override
  Future<List<HomeModel>> getAllItems(String path) async {
    var items = await client.getAllItems();
    return items;
  }
  // final http.Client client;

  // HomeRemoteDataSourceImpl({required this.client});

  // @override
  // Future<List<HomeModel>> getAllItems(String path) =>
  //     _getItemsFromUrl('https://db2021ecom-edca.restdb.io/rest/$path');

  // Future<List<HomeModel>> _getItemsFromUrl(String url) async {
  //   final response = await client.get(Uri.parse(url),
  //       headers: {'x-apikey': '2aa8e910f6c4ade81a84c9333ffc7bf6a398e'});

  //   if (response.statusCode == 200) {
  //     final items = json.decode(response.body);
  //     return (items as List).map((json) => HomeModel.fromJson(json)).toList();
  //   } else {
  //     throw ServerException();
  //   }
  // }
}
