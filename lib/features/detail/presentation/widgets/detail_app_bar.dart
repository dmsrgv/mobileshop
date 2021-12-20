import 'package:flutter/material.dart';
import 'package:mobileshop/features/cart/presentation/pages/cart_screen.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFF010035),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            'Product Details',
            style: TextStyle(
                color: Color(0xFF010035),
                fontFamily: 'Mark Pro',
                fontWeight: FontWeight.w500,
                fontSize: 18),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFFFF6E4E),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.local_grocery_store,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
