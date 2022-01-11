import 'package:flutter/material.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';
import 'package:mobileshop/features/detail/presentation/widgets/carousel_slider_widget.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_button.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_category_list.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_rating.dart';
import 'package:mobileshop/features/detail/presentation/widgets/details_phone.dart';
import 'package:mobileshop/features/detail/presentation/widgets/select_details.dart';
import 'package:mobileshop/features/detail/presentation/widgets/title_phone.dart';

import 'detail_app_bar.dart';

class DetailLoadedScreen extends StatelessWidget {
  const DetailLoadedScreen({
    Key? key,
    required this.imagesList,
    required this.productDetailsList,
  }) : super(key: key);

  final List imagesList;
  final List<ProductDetailsEntity> productDetailsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const DetailAppBar(),
            CarouselSliderWidget(imagesList: imagesList),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    children: [
                      TitlePhone(productDetailsList: productDetailsList),
                      DetailRating(productDetailsList: productDetailsList),
                      DetailCategoryList(),
                      DetailsPhone(
                        productDetailsList: productDetailsList,
                      ),
                      SelectDetails(items: productDetailsList),
                      const SizedBox(
                        height: 30,
                      ),
                      DetailButton(productDetailsList: productDetailsList),
                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
