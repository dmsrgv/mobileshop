import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobileshop/features/cart/domain/usecases/get_cart_items.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItems getCartItems;

  CartBloc({required this.getCartItems}) : super(CartInitialState()) {
    on<LoadCartScreenEvent>((event, emit) async {
      emit(CartLoadingState());
      final _loadedHomeList =
          await getCartItems.call(PathCartParams(path: 'mycart'));
      emit(_loadedHomeList.fold((failure) => CartErrorState(),
          (list) => CartLoadedState(loadedData: list)));
    });
  }
}
