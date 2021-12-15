import 'package:mobileshop/core/error/exception.dart';
import 'package:mobileshop/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobileshop/core/platform/network_info.dart';
import 'package:mobileshop/features/detail/data/datasources/product_details_remote_datasource.dart';
import 'package:mobileshop/features/detail/domain/repositories/product_details_repository.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource? productDetailsRemoteDataSource;
  final NetworkInfo? networkInfo;

  ProductDetailsRepositoryImpl(
      {required this.productDetailsRemoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List>> getProductDetails(String path) async {
    if (await networkInfo!.isConnected) {
      try {
        final remoteItems =
            await productDetailsRemoteDataSource?.getProductDetails(path);
        return Right(remoteItems!);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
