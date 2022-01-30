import 'package:dio/dio.dart' hide Headers;
import 'package:mobileshop/features/detail/data/models/product_details_model.dart';
import 'package:mobileshop/features/home/data/models/home_model.dart';
import 'package:retrofit/retrofit.dart';

part 'detail_api.g.dart';

@RestApi(baseUrl: "")
abstract class DetailApi {
  factory DetailApi(Dio dio, {String baseUrl}) = _DetailApi;

  @GET("/detail")
  Future<List<ProductDetailsModel>> getProductDetails();
}
