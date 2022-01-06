import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/common/app_icons.dart';
import 'package:mobileshop/components/map_screen.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
          Row(
            children: [
              const Text(
                'Add address',
                style: TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapScreen()));
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset(
                    AppIcons.geo,
                    color: Colors.white,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
