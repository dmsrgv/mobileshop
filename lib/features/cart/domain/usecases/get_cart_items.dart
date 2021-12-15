import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobileshop/core/error/failure.dart';
import 'package:mobileshop/core/usecases/usecase.dart';
import 'package:mobileshop/features/cart/domain/repositories/cart_repository.dart';

class GetCartItems extends UseCase<List<dynamic>, PathCartParams> {
  final CartRepository cartRepository;

  GetCartItems(this.cartRepository);

  @override
  Future<Either<Failure, List<dynamic>>> call(PathCartParams params) async {
    return await cartRepository.getCartItems(params.path);
  }
}

class PathCartParams extends Equatable {
  final String path;
  PathCartParams({
    required this.path,
  });

  @override
  List<Object?> get props => [path];
}
