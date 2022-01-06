import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/common/app_icons.dart';
import 'package:mobileshop/components/cache_image.dart';
import 'package:mobileshop/features/cart/domain/entities/cart_entity.dart';

class CartPhoneWidget extends StatelessWidget {
  const CartPhoneWidget({
    Key? key,
    required this.listBasket,
    required this.index,
  }) : super(key: key);
  final int index;
  final List<BasketEntity> listBasket;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Container(
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: CacheImage(
                  imageUrl: listBasket[index].image,
                  width: 90,
                  height: 100,
                  cover: false)),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listBasket[index].title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 22),
                  ),
                  Text(
                    '\$' + listBasket[index].price.toString(),
                    style: TextStyle(
                        color: AppColors.orange,
                        fontWeight: FontWeight.w400,
                        fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 30,
            height: 80,
            decoration: BoxDecoration(
                color: Color(0xFF282843),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Text(
                  '-',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
                Text(
                  '2',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
                Text(
                  '+',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SvgPicture.asset(AppIcons.clear)
        ],
      ),
    );
  }
}
