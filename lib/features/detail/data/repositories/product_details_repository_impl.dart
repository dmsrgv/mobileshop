import 'package:mobileshop/core/error/exception.dart';
import 'package:mobileshop/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobileshop/core/platform/network_info.dart';
import 'package:mobileshop/features/detail/data/datasources/product_details_local_datasource.dart';
import 'package:mobileshop/features/detail/data/datasources/product_details_remote_datasource.dart';
import 'package:mobileshop/features/detail/data/models/product_details_model.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';
import 'package:mobileshop/features/detail/domain/repositories/product_details_repository.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;
  final ProductDetailsLocalDataSource productDetailsLocalDataSource;
  final NetworkInfo networkInfo;

  ProductDetailsRepositoryImpl(
      {required this.productDetailsRemoteDataSource,
      required this.productDetailsLocalDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<ProductDetailsEntity>>> getProductDetails(
      String path) async {
    return await _getItems(() {
      return productDetailsRemoteDataSource.getProductDetails(path);
    });
  }

  Future<Either<Failure, List<ProductDetailsModel>>> _getItems(
      Future<List<ProductDetailsModel>> Function() getItems) async {
    if (await networkInfo.isConnected) {
      try {
        List<ProductDetailsModel> remoteItems = await getItems();
        productDetailsLocalDataSource.insertDetail(remoteItems.first);
        return Right(remoteItems);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localItem = await productDetailsLocalDataSource.readDetail();
        final List<ProductDetailsModel> localItems = [];
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
