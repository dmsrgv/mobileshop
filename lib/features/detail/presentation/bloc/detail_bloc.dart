import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';
import 'package:mobileshop/features/detail/domain/usecases/get_product_details.dart';
part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetProductDetails getProductDetails;

  DetailBloc({required this.getProductDetails}) : super(DetailInitialState());
  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is LoadDetailScreenEvent) {
      yield DetailLoadingState();
      final _loadedDetailList = await getProductDetails
          .call(PathProductDetailsParams(path: 'productdetails'));
      yield _loadedDetailList.fold((failure) => DetailErrorState(),
          (list) => DetailLoadedState(loadedData: list.toList()));
    } else {
      yield DetailInitialState();
    }
  }
}
