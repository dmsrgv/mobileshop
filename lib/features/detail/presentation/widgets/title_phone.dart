import 'package:flutter/material.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';

class TitlePhone extends StatelessWidget {
  const TitlePhone({
    Key? key,
    required this.productDetailsList,
  }) : super(key: key);

  final List<ProductDetailsEntity> productDetailsList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          productDetailsList[0].title,
          style: const TextStyle(
              color: Color(0xFF010035),
              fontFamily: 'Mark Pro',
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Color(0xFF010035), borderRadius: BorderRadius.circular(5)),
          child: const Icon(
            Icons.favorite_outline,
            size: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
