import 'package:dio/dio.dart';
import 'package:mobileshop/core/utils/cart_api.dart';
import 'package:mobileshop/core/utils/detail_api.dart';
import 'package:mobileshop/core/utils/home_api.dart';

class Api {
  late Dio dio;
  late final HomeApi home;
  late DetailApi detail;
  late final CartApi cart;
  Api() {
    dio = Dio(BaseOptions(baseUrl: 'https://shopapi-0575.restdb.io/rest/'));

    home = HomeApi(dio);
    detail = DetailApi(dio);
    cart = CartApi(dio);
  }
}
