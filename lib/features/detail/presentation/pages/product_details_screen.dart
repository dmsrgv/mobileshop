import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/detail/domain/entities/product_details_entity.dart';
import 'package:mobileshop/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_error_screen.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_initial_screen.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_loaded_screen.dart';
import 'package:mobileshop/features/detail/presentation/widgets/detail_loading_screen.dart';
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
        return DetailLoadedScreen(
            imagesList: imagesList, productDetailsList: productDetailsList);
      }
      return const DetailErrorScreen();
    });
  }
}
