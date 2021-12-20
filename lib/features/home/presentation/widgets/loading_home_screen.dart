import 'package:flutter/material.dart';

class LoadingHomeScreen extends StatelessWidget {
  const LoadingHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
