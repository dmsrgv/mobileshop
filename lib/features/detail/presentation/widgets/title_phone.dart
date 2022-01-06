import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/common/app_icons.dart';
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
              color: AppColors.blue, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Container(
          width: 35,
          height: 30,
          decoration: BoxDecoration(
              color: AppColors.blue, borderRadius: BorderRadius.circular(8)),
          child: SvgPicture.asset(
            AppIcons.like,
            fit: BoxFit.none,
            width: 8,
            height: 8,
          ),
        ),
      ],
    );
  }
}
