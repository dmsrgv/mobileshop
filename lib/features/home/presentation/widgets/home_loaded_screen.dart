import 'package:flutter/material.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/features/home/domain/entities/bestseller_entity.dart';
import 'package:mobileshop/features/home/domain/entities/home_entity.dart';
import 'package:mobileshop/features/home/domain/entities/homestore_entity.dart';
import 'package:mobileshop/features/home/presentation/widgets/bestseller_widget.dart';
import 'package:mobileshop/features/home/presentation/widgets/hotsales_widget.dart';
import 'package:mobileshop/features/home/presentation/widgets/location_widget.dart';
import 'package:mobileshop/features/home/presentation/widgets/select_category_widget.dart';

class HomeLoadedScreen extends StatelessWidget {
  const HomeLoadedScreen({
    Key? key,
    required this.listHomeStore,
    required this.listBestSeller,
  }) : super(key: key);

  final List<HomeStoreEntity> listHomeStore;
  final List<BestSellerEntity> listBestSeller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const LocationWidget(),
              const SizedBox(
                height: 20,
              ),
              const SelectCategoryWidget(),
              const SizedBox(
                height: 25,
              ),
              HotSalesWidget(
                items: listHomeStore,
              ),
              const SizedBox(
                height: 15,
              ),
              BestSellerWidget(items: listBestSeller),
            ],
          ),
        ),
      )),
    );
  }
}
