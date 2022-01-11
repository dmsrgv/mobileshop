import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import 'package:mobileshop/features/cart/data/models/cart_model.dart';
import 'package:mobileshop/features/detail/data/models/product_details_model.dart';
import 'package:mobileshop/features/home/data/models/home_model.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: "https://shopapi-0575.restdb.io/rest/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/home")
  @Headers(<String, dynamic>{'x-apikey': '61ddae2e95cb716ea5ee48e4'})
  Future<List<HomeModel>> getAllItems();

  @GET("/detail")
  @Headers(<String, dynamic>{'x-apikey': '61ddae2e95cb716ea5ee48e4'})
  Future<List<ProductDetailsModel>> getProductDetails();

  @GET("/cart")
  @Headers(<String, dynamic>{'x-apikey': '61ddae2e95cb716ea5ee48e4'})
  Future<List<CartModel>> getCartItems();
}
