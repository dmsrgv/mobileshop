import 'package:dartz/dartz.dart';
import 'package:mobileshop/core/error/failure.dart';
import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartEntity>>> getCartItems(String path);
}
