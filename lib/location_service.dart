import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobileshop/core/platform/network_info.dart';
import 'package:mobileshop/features/detail/domain/usecases/get_product_details.dart';
import 'package:mobileshop/features/home/data/datasources/home_remote_datasource.dart';
import 'package:mobileshop/features/home/data/repositories/home_repository_impl.dart';
import 'package:mobileshop/features/home/domain/repositories/home_repository.dart';
import 'package:mobileshop/features/home/domain/usecases/get_all_items.dart';
import 'package:mobileshop/features/home/presentation/bloc/home_bloc.dart';
import 'package:http/http.dart' as http;

import 'features/cart/data/datasources/cart_remote_data_source.dart';
import 'features/cart/data/repositories/cart_repository_impl.dart';
import 'features/cart/domain/repositories/cart_repository.dart';
import 'features/cart/domain/usecases/get_cart_items.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/detail/data/datasources/product_details_remote_datasource.dart';
import 'features/detail/data/repositories/product_details_repository_impl.dart';
import 'features/detail/domain/repositories/product_details_repository.dart';
import 'features/detail/presentation/bloc/detail_bloc.dart';

final GetIt sl = GetIt.instance;

init() {
  //BLOC
  sl.registerFactory(() => HomeBloc(getAllItems: sl()));
  sl.registerFactory(() => DetailBloc(getProductDetails: sl()));
  sl.registerFactory(() => CartBloc(getCartItems: sl()));

  //USECASES
  sl.registerLazySingleton(() => GetAllItems(sl()));
  sl.registerLazySingleton(() => GetProductDetails(sl()));
  sl.registerLazySingleton(() => GetCartItems(sl()));

  //REPOSITORY
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProductDetailsRepository>(() =>
      ProductDetailsRepositoryImpl(
          productDetailsRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(cartRemoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<ProductDetailsRemoteDataSource>(
      () => ProductDetailsDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(client: http.Client()));

  //CORE

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //Depens

  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
