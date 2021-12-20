import 'package:flutter/material.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/home/presentation/widgets/category_list.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Select Category',
                style: TextStyle(
                    fontFamily: 'Mark Pro',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF010035)),
              ),
              Text(
                'view all',
                style: TextStyle(
                    fontFamily: 'Mark Pro',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFF6E4E)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 120,
          width: SizeConfig.screenWidth,
          child: CategoryList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: const [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                ),
                width: SizeConfig.blockSizeHorizontal! * 70,
                height: 32,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
              ),
              const Icon(
                Icons.qr_code_rounded,
                size: 25,
                color: Color(0xFFFF6E4E),
              )
            ],
          ),
        )
      ],
    );
  }
}
