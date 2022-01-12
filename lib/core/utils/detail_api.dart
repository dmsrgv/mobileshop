import 'package:dio/dio.dart' hide Headers;
import 'package:mobileshop/features/detail/data/models/product_details_model.dart';
import 'package:mobileshop/features/home/data/models/home_model.dart';
import 'package:retrofit/retrofit.dart';

part 'detail_api.g.dart';

@RestApi(baseUrl: "")
abstract class DetailApi {
factory DetailApi(Dio dio, {String baseUrl}) = _DetailApi;

  @GET("/detail")
  @Headers(<String, dynamic>{'x-apikey': '61ddae2e95cb716ea5ee48e4'})
  Future<List<ProductDetailsModel>> getProductDetails();



}