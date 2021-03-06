import 'package:dio/dio.dart' hide Headers;
import 'package:mobileshop/features/cart/data/models/cart_model.dart';
import 'package:mobileshop/features/home/data/models/home_model.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api.g.dart';

@RestApi(baseUrl: "")
abstract class CartApi {
  factory CartApi(Dio dio, {String baseUrl}) = _CartApi;

  @GET("/cart")
  Future<List<CartModel>> getCartItems();
}
