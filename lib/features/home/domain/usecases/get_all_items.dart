import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobileshop/core/error/failure.dart';

import 'package:mobileshop/core/usecases/usecase.dart';
import 'package:mobileshop/features/home/domain/entities/home_entity.dart';
import 'package:mobileshop/features/home/domain/repositories/home_repository.dart';

class GetAllItems extends UseCase<List<dynamic>, PathHomeParams> {
  final HomeRepository homeRepository;

  GetAllItems(this.homeRepository);

  @override
  Future<Either<Failure, List<dynamic>>> call(PathHomeParams params) async {
    return await homeRepository.getAllItems(params.path);
  }
}

class PathHomeParams extends Equatable {
  final String path;
  PathHomeParams({
    required this.path,
  });

  @override
  List<Object?> get props => [path];
}
