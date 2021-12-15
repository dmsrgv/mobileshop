import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileshop/components/nav_bar.dart';
import 'package:mobileshop/components/nav_bar.dart';
import 'package:mobileshop/features/home/presentation/bloc/home_bloc.dart';
import 'package:mobileshop/features/home/presentation/pages/home_screen.dart';
import 'package:mobileshop/location_service.dart' as di;

import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/detail/presentation/bloc/detail_bloc.dart';
import 'location_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
              create: (context) => sl<HomeBloc>()..add(LoadHomeScreenEvent())),
          BlocProvider<DetailBloc>(
              create: (context) =>
                  sl<DetailBloc>()..add(LoadDetailScreenEvent())),
          BlocProvider<CartBloc>(
              create: (context) => sl<CartBloc>()..add(LoadCartScreenEvent()))
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: NavBar(),
        ));
  }
}
