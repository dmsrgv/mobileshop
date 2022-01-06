import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobileshop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_button.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_error_screen.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_initial_screen.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_loading_screen.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_phones.dart';
import 'package:mobileshop/features/cart/presentation/widgets/delivery_text.dart';
import 'package:mobileshop/features/cart/presentation/widgets/title_cart.dart';
import 'package:mobileshop/features/cart/presentation/widgets/total_text.dart';

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
        return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CartAppBar(),
                const TitleCart(),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        CartPhones(listBasket: listBasket),
                        Divider(
                          thickness: 2,
                          color: Colors.white.withOpacity(0.25),
                        ),
                        TotalText(items: items),
                        DeliveryText(items: items),
                        Divider(
                          thickness: 1,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        const CartButton(),
                      ],
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: AppColors.blue),
                  ),
                )
              ],
            )));
      }
      return const CartErrorScreen();
    });
  }
}
