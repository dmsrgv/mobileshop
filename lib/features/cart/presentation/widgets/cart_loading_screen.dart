import 'package:flutter/material.dart';

class CartLoadingScreen extends StatelessWidget {
  const CartLoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
