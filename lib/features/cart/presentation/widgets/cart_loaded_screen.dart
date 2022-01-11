import 'package:flutter/material.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_phones.dart';
import 'package:mobileshop/features/cart/presentation/widgets/title_cart.dart';
import 'package:mobileshop/features/cart/presentation/widgets/total_text.dart';

import 'cart_button.dart';
import 'delivery_text.dart';

class CartLoadedScreen extends StatelessWidget {
  const CartLoadedScreen({
    Key? key,
    required this.listBasket,
    required this.items,
  }) : super(key: key);

  final List<BasketEntity> listBasket;
  final List<CartEntity> items;

  @override
  Widget build(BuildContext context) {
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
}
