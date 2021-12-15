part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<dynamic> loadedData;

  CartLoadedState({required this.loadedData});

  List<dynamic> get getDetails => loadedData;

  @override
  List<Object> get props => [loadedData];
}

class CartErrorState extends CartState {}
