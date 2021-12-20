import 'package:flutter/material.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';

class DetailRating extends StatelessWidget {
  const DetailRating({
    Key? key,
    required this.productDetailsList,
  }) : super(key: key);

  final List<ProductDetailsEntity> productDetailsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productDetailsList[0].rating.toInt(),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(
                Icons.star,
                color: Color(0xFFFFB800),
              ),
            );
          }),
    );
  }
}
