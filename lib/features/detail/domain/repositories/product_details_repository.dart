import 'package:dartz/dartz.dart';
import 'package:mobileshop/core/error/failure.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, List<dynamic>>> getProductDetails(String path);
}
