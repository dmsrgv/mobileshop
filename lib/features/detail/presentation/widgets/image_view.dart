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
            width: SizeConfig.screenWidth! / 2.5,
            height: SizeConfig.screenHeight!,
            cover: true));
  }
}
