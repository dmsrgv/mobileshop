import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/common/app_icons.dart';
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
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                AppIcons.left_array,
                fit: BoxFit.none,
              ),
            ),
          ),
          const Text(
            'Product Details',
            style: TextStyle(
                color: AppColors.blue,
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
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                AppIcons.cart,
                fit: BoxFit.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
