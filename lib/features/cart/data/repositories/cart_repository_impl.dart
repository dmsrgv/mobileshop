import 'package:dartz/dartz.dart';
import 'package:mobileshop/core/error/exception.dart';
import 'package:mobileshop/core/error/failure.dart';
import 'package:mobileshop/core/platform/network_info.dart';
import 'package:mobileshop/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:mobileshop/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:mobileshop/features/cart/data/models/cart_model.dart';
import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobileshop/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;
  final NetworkInfo networkInfo;
  final CartLocalDataSource cartLocalDataSource;

  CartRepositoryImpl(
      {required this.cartRemoteDataSource,
      required this.cartLocalDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<CartEntity>>> getCartItems(String query) async {
    return await _getItems(() {
      return cartRemoteDataSource.getCartItems(query);
    });
  }

  Future<Either<Failure, List<CartModel>>> _getItems(
      Future<List<CartModel>> Function() getItems) async {
    if (await networkInfo.isConnected) {
      try {
        List<CartModel> remoteItems = await getItems();
        cartLocalDataSource.insertCart(remoteItems.first);
        return Right(remoteItems);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localItem = await cartLocalDataSource.readCart();
        final List<CartModel> localItems = [];
        localItems.add(localItem);
        return Right(localItems);
      } on CacheException {
        return Left(CacheFailure());
      } catch (error) {
        return Left(ServerFailure());
      }
    }
  }
}
