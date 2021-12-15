import 'package:dartz/dartz.dart';
import 'package:mobileshop/core/error/failure.dart';

abstract class CartRepository {
  Future<Either<Failure, List<dynamic>>> getCartItems(String path);
}
