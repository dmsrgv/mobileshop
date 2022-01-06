import 'package:flutter/material.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/home/domain/entities/homestore_entity.dart';
import 'package:mobileshop/features/home/presentation/widgets/hotsales_item.dart';

class HotSalesWidget extends StatelessWidget {
  final List<HomeStoreEntity> items;

  HotSalesWidget({
    required this.items,
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
                'Hot Sales',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue),
              ),
              Text(
                'see more',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.orange),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            height: 200,
            width: SizeConfig.screenWidth,
            child: PageView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return HotSalesItem(item: items[index]);
                }),
          ),
        )
      ],
    );
  }
}
