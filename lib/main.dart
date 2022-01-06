import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobileshop/components/map_screen.dart';
import 'package:mobileshop/components/nav_bar.dart';
import 'package:mobileshop/features/cart/presentation/pages/cart_screen.dart';
import 'package:mobileshop/features/home/presentation/bloc/home_bloc.dart';
import 'package:mobileshop/location_service.dart' as di;

import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/detail/presentation/bloc/detail_bloc.dart';
import 'features/detail/presentation/pages/product_details_screen.dart';
import 'location_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  final PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();

  runApp(MyApp(initialLink));
}

class MyApp extends StatefulWidget {
  const MyApp(PendingDynamicLinkData? initialLink, {Key? key})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PendingDynamicLinkData? get initialLink {
    if (initialLink != null) {
      final Uri deepLink = initialLink!.link;
      navKey.currentState!.pushNamed(deepLink.path);
    }
  }

  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    navKey.currentState!.pushNamed('/detail');
  }

  @override
  void initState() {
    super.initState();
    setupInteractedMessage();

    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      navKey.currentState!.pushNamed(dynamicLinkData.link.path);
    }).onError((error) {
      print('error links');
    });
  }

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
        child: MaterialApp(
          navigatorKey: navKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Mark Pro'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const NavBar(),
          initialRoute: '/',
          routes: {
            '/mapscreen': (context) => const MapScreen(),
            '/cart': (context) => const CartScreen(),
            '/detail': (context) => const ProductDetailsScreen(),
          },
        ));
  }
}
