import 'package:flutter/material.dart';
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
              const Icon(
                Icons.memory,
                size: 20,
                color: Color(0xFFB7B7B7),
              ),
              Text(
                productDetailsList[0].cpu.toString(),
                style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                size: 20,
                color: Color(0xFFB7B7B7),
              ),
              Text(
                productDetailsList[0].camera.toString(),
                style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.storage,
                size: 20,
                color: Color(0xFFB7B7B7),
              ),
              Text(
                productDetailsList[0].ssd.toString(),
                style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.sd_card,
                size: 20,
                color: Color(0xFFB7B7B7),
              ),
              Text(
                productDetailsList[0].sd.toString(),
                style: const TextStyle(
                    color: Color(0xFFB7B7B7),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
