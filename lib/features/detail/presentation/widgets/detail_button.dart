import 'package:flutter/material.dart';
import 'package:mobileshop/features/cart/presentation/pages/cart_screen.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';

class DetailButton extends StatelessWidget {
  const DetailButton({
    Key? key,
    required this.productDetailsList,
  }) : super(key: key);

  final List<ProductDetailsEntity> productDetailsList;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Color(0xFFFF6E4E)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CartScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Add to Cart',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
            Text(
              '\$' + productDetailsList[0].price.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
