import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFF010035),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              const Text(
                'Add address',
                style: TextStyle(
                    color: Color(0xFF010035),
                    fontFamily: 'Mark Pro',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFFFF6E4E),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.add_location,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
