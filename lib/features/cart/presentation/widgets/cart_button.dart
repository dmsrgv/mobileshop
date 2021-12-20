import 'package:flutter/material.dart';
import 'package:mobileshop/components/size_config.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(SizeConfig.screenWidth! * 0.8, 50),
            primary: Color(0xFFFF6E4E)),
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            'Checkout',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
