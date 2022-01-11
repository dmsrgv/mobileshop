import 'package:flutter/material.dart';
import 'package:mobileshop/common/constants.dart';

class CartErrorScreen extends StatelessWidget {
  const CartErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(Constants.textError),
    );
  }
}
