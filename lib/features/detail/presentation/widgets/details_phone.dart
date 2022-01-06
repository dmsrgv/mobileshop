import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileshop/common/app_icons.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';

class DetailsPhone extends StatelessWidget {
  List<ProductDetailsEntity> productDetailsList;

  DetailsPhone({required this.productDetailsList});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                AppIcons.proc,
                fit: BoxFit.none,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                productDetailsList[0].cpu.toString(),
                style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(
                AppIcons.camera,
                fit: BoxFit.none,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                productDetailsList[0].camera.toString(),
                style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(
                AppIcons.sd,
                fit: BoxFit.none,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                productDetailsList[0].ssd.toString(),
                style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(
                AppIcons.card,
                fit: BoxFit.none,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                productDetailsList[0].sd.toString(),
                style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
