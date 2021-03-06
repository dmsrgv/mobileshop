import 'package:flutter/material.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:mobileshop/components/cache_image.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/home/domain/entities/homestore_entity.dart';

class HotSalesItem extends StatelessWidget {
  final HomeStoreEntity item;
  const HotSalesItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CacheImage(
          imageUrl: item.picture.toString(),
          width: SizeConfig.screenHeight,
          height: SizeConfig.screenWidth,
          cover: true),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: item.is_new == true
                ? Container(
                    child: const Center(
                        child: Text(
                      'New',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    )),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.orange),
                  )
                : Container(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              item.title.toString(),
              style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 30),
            child: Text(
              item.subtitle.toString(),
              style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: const Center(
                  child: Text(
                'Buy now!',
                style: TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              )),
              width: 115,
              height: 25,
            ),
          )
        ],
      ),
    ]);
  }
}
