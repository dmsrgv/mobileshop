import 'package:dio/dio.dart' hide Headers;
import 'package:mobileshop/features/home/data/models/home_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: "")
abstract class HomeApi {
factory HomeApi(Dio dio, {String baseUrl}) = _HomeApi;

 @GET("/home")
  @Headers(<String, dynamic>{'x-apikey': '61ddae2e95cb716ea5ee48e4'})
  Future<List<HomeModel>> getAllItems();



}