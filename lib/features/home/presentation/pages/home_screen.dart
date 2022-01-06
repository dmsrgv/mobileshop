import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileshop/common/app_colors.dart';

import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/home/domain/entities/bestseller_entity.dart';
import 'package:mobileshop/features/home/domain/entities/home_entity.dart';
import 'package:mobileshop/features/home/domain/entities/homestore_entity.dart';
import 'package:mobileshop/features/home/presentation/bloc/home_bloc.dart';
import 'package:mobileshop/features/home/presentation/widgets/bestseller_widget.dart';
import 'package:mobileshop/features/home/presentation/widgets/error_screen.dart';
import 'package:mobileshop/features/home/presentation/widgets/hotsales_widget.dart';
import 'package:mobileshop/features/home/presentation/widgets/initial_error_screen.dart';
import 'package:mobileshop/features/home/presentation/widgets/loading_home_screen.dart';
import 'package:mobileshop/features/home/presentation/widgets/location_widget.dart';
import 'package:mobileshop/features/home/presentation/widgets/select_category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      List<HomeEntity> items = [];
      if (state is HomeLoadingState) {
        return const LoadingHomeScreen();
      }
      if (state is HomeErrorState) {
        return const ErrorScreen();
      }

      if (state is HomeInitialState) {
        return const InitialErrorScreen();
      }

      if (state is HomeLoadedState) {
        items = state.loadedData as List<HomeEntity>;
        List<HomeStoreEntity> listHomeStore = items[0].homeStore;
        List<BestSellerEntity> listBestSeller = items[0].bestSeller;
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
      return const ErrorScreen();
    });
  }
}
