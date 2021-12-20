import 'package:flutter/material.dart';

class TitleCart extends StatelessWidget {
  const TitleCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Text(
        'My Cart',
        style: TextStyle(
            color: Color(0xFF010035),
            fontFamily: 'Mark Pro',
            fontWeight: FontWeight.w700,
            fontSize: 32),
      ),
    );
  }
}
