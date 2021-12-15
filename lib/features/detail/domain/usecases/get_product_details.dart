import 'package:equatable/equatable.dart';
import 'package:mobileshop/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobileshop/core/usecases/usecase.dart';
import 'package:mobileshop/features/detail/domain/repositories/product_details_repository.dart';

class GetProductDetails
    extends UseCase<List<dynamic>, PathProductDetailsParams> {
  final ProductDetailsRepository productDetailsRepository;

  GetProductDetails(this.productDetailsRepository);
  @override
  Future<Either<Failure, List>> call(PathProductDetailsParams params) async {
    return await productDetailsRepository.getProductDetails(params.path);
  }
}

class PathProductDetailsParams extends Equatable {
  final String path;
  PathProductDetailsParams({
    required this.path,
  });

  @override
  List<Object?> get props => [path];
}
