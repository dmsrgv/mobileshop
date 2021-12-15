import 'package:dartz/dartz.dart';
import 'package:mobileshop/core/error/failure.dart';
import 'package:mobileshop/features/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<dynamic>>> getAllItems(String path);
}
