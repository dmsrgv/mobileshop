import 'package:mobileshop/core/error/exception.dart';
import 'package:mobileshop/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobileshop/core/platform/network_info.dart';
import 'package:mobileshop/features/home/data/datasources/home_remote_datasource.dart';
import 'package:mobileshop/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource? homeRemoteDataSource;
  final NetworkInfo? networkInfo;

  HomeRepositoryImpl(
      {required this.homeRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List>> getAllItems(String path) async {
    if (await networkInfo!.isConnected) {
      try {
        final remoteItems = await homeRemoteDataSource?.getAllItems(path);
        return Right(remoteItems!);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
