import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import 'package:mobileshop/features/cart/data/models/cart_model.dart';
import 'package:mobileshop/features/detail/data/models/product_details_model.dart';
import 'package:mobileshop/features/home/data/models/home_model.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: "https://db2021ecom-edca.restdb.io/rest/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/main")
  @Headers(
      <String, dynamic>{'x-apikey': '2aa8e910f6c4ade81a84c9333ffc7bf6a398e'})
  Future<List<HomeModel>> getAllItems();

  @GET("/productdetails")
  @Headers(
      <String, dynamic>{'x-apikey': '2aa8e910f6c4ade81a84c9333ffc7bf6a398e'})
  Future<List<ProductDetailsModel>> getProductDetails();

  @GET("/mycart")
  @Headers(
      <String, dynamic>{'x-apikey': '2aa8e910f6c4ade81a84c9333ffc7bf6a398e'})
  Future<List<CartModel>> getCartItems();
}
