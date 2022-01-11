import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobileshop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_error_screen.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_initial_screen.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_loaded_screen.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_loading_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      List<CartEntity> items = [];
      if (state is CartLoadingState) {
        return const CartLoadingScreen();
      }
      if (state is CartErrorState) {
        return const CartErrorScreen();
      }

      if (state is CartInitialState) {
        return const CartInititialScreen();
      }

      if (state is CartLoadedState) {
        items = state.loadedData as List<CartEntity>;
        List<BasketEntity> listBasket = items[0].basket;
        return CartLoadedScreen(listBasket: listBasket, items: items);
      }
      return const CartErrorScreen();
    });
  }
}
