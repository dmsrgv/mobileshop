import 'package:dartz/dartz.dart';
import 'package:mobileshop/core/error/failure.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, List<ProductDetailsEntity>>> getProductDetails(
      String path);
}
