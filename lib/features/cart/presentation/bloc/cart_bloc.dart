import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobileshop/features/cart/domain/usecases/get_cart_items.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItems getCartItems;

  CartBloc({required this.getCartItems}) : super(CartInitialState());
  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is LoadCartScreenEvent) {
      yield CartLoadingState();
      final _loadedHomeList =
          await getCartItems.call(PathCartParams(path: 'mycart'));
      yield _loadedHomeList.fold((failure) => CartErrorState(),
          (list) => CartLoadedState(loadedData: list));
    } else {
      yield CartInitialState();
    }
  }
}
