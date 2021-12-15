import 'package:dartz/dartz.dart';
import 'package:mobileshop/core/error/exception.dart';
import 'package:mobileshop/core/error/failure.dart';
import 'package:mobileshop/core/platform/network_info.dart';
import 'package:mobileshop/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:mobileshop/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource? cartRemoteDataSource;
  final NetworkInfo? networkInfo;

  CartRepositoryImpl(
      {required this.cartRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List>> getCartItems(String path) async {
    if (await networkInfo!.isConnected) {
      try {
        final remoteItems = await cartRemoteDataSource?.getCartItems(path);
        return Right(remoteItems!);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
