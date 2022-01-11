import 'package:flutter/material.dart';
import 'package:mobileshop/common/constants.dart';

class DetailErrorScreen extends StatelessWidget {
  const DetailErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(Constants.textError),
    );
  }
}
