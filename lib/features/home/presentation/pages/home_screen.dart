import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/home/domain/entities/bestseller_entity.dart';
import 'package:mobileshop/features/home/domain/entities/home_entity.dart';
import 'package:mobileshop/features/home/domain/entities/homestore_entity.dart';
import 'package:mobileshop/features/home/presentation/bloc/home_bloc.dart';
import 'package:mobileshop/features/home/presentation/widgets/error_screen.dart';
import 'package:mobileshop/features/home/presentation/widgets/home_loaded_screen.dart';
import 'package:mobileshop/features/home/presentation/widgets/initial_error_screen.dart';
import 'package:mobileshop/features/home/presentation/widgets/loading_home_screen.dart';

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
        return HomeLoadedScreen(
            listHomeStore: listHomeStore, listBestSeller: listBestSeller);
      }
      return const ErrorScreen();
    });
  }
}
