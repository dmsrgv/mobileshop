import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';
import 'package:mobileshop/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:mobileshop/features/detail/presentation/widgets/carousel_slider_widget.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_app_bar.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_button.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_category_list.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_error_screen.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_initial_screen.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_loading_screen.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_rating.dart';
import 'package:mobileshop/features/detail/presentation/widgets/details_phone.dart';
import 'package:mobileshop/features/detail/presentation/widgets/select_details.dart';
import 'package:mobileshop/features/detail/presentation/widgets/title_phone.dart';
import 'package:mobileshop/features/home/domain/entities/bestseller_entity.dart';

class ProductDetailsScreen extends StatelessWidget {
  final BestSellerEntity? items;

  const ProductDetailsScreen({Key? key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
      List<ProductDetailsEntity> productDetailsList = [];
      if (state is DetailLoadingState) {
        return const DetailLoadingScreen();
      }
      if (state is DetailErrorState) {
        return const DetailErrorScreen();
      }

      if (state is DetailInitialState) {
        return const DetailInititialScreen();
      }

      if (state is DetailLoadedState) {
        productDetailsList = state.loadedData as List<ProductDetailsEntity>;
        final List<dynamic> imagesList = productDetailsList[0].images;
        return Scaffold(
          backgroundColor: const Color(0xFFE5E5E5),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
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
      return const DetailErrorScreen();
    });
  }
}
