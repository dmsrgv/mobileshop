import 'package:flutter/material.dart';
import 'package:mobileshop/common/constants.dart';

class CartInititialScreen extends StatelessWidget {
  const CartInititialScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(Constants.textInitialError),
    );
  }
}
