import 'package:flutter/material.dart';
import 'package:mobileshop/components/cache_image.dart';
import 'package:mobileshop/components/size_config.dart';

class ImageView extends StatelessWidget {
  String? imgUrl;

  ImageView(this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: CacheImage(
            imageUrl: imgUrl!,
            width: SizeConfig.screenWidth! / 3,
            height: SizeConfig.screenHeight! / 6,
            cover: true));
  }
}
