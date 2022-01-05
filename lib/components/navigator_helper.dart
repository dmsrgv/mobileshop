import 'package:flutter/material.dart';

class NavigatorHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static pushToDetail() async {
    NavigatorHelper.navigatorKey.currentState!.pushNamed('/detail');
  }

  static pushToCart() async {
    NavigatorHelper.navigatorKey.currentState!.pushNamed('/cart');
  }

  static pushToNamedRoute(String routeName) async {
    NavigatorHelper.navigatorKey.currentState!.pushNamed(routeName);
  }
}
