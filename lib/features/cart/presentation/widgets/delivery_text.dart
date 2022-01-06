import 'package:flutter/material.dart';
import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';

class DeliveryText extends StatelessWidget {
  const DeliveryText({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<CartEntity> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Delivery',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
          Text(
            items[0].delivery,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
