import 'package:mobileshop/core/db/database.dart';
import 'package:mobileshop/core/error/exception.dart';
import 'package:mobileshop/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobileshop/core/platform/network_info.dart';
import 'package:mobileshop/features/home/data/datasources/home_local_datasource.dart';
import 'package:mobileshop/features/home/data/datasources/home_remote_datasource.dart';
import 'package:mobileshop/features/home/data/models/home_model.dart';
import 'package:mobileshop/features/home/domain/entities/home_entity.dart';
import 'package:mobileshop/features/home/domain/repositories/home_repository.dart';
import 'package:sqflite/sqflite.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {required this.homeLocalDataSource,
      required this.homeRemoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<HomeEntity>>> getAllItems(String query) async {
    return await _getItems(() {
      return homeRemoteDataSource.getAllItems(query);
    });
  }

  Future<Either<Failure, List<HomeModel>>> _getItems(
      Future<List<HomeModel>> Function() getItems) async {
    if (await networkInfo.isConnected) {
      try {
        List<HomeModel> remoteItems = await getItems();
        homeLocalDataSource.insertHome(remoteItems.first);
        return Right(remoteItems);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localItem = await homeLocalDataSource.readHome();
        final List<HomeModel> localItems = [];
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
