import 'package:flutter/material.dart';
import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobileshop/features/cart/presentation/widgets/cart_phone_widget.dart';

class CartPhones extends StatelessWidget {
  const CartPhones({
    Key? key,
    required this.listBasket,
  }) : super(key: key);

  final List<BasketEntity> listBasket;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          child: ListView.builder(
              itemCount: listBasket.length,
              itemBuilder: (context, index) {
                return CartPhoneWidget(listBasket: listBasket, index: index);
              }),
        ),
      ),
    );
  }
}
