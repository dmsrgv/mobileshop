import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobileshop/common/app_images.dart';

class CacheImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final bool cover;

  const CacheImage(
      {Key? key,
      required this.imageUrl,
      required this.width,
      required this.height,
      required this.cover})
      : super(key: key);

  Widget _imageWidget(imageProvider) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: cover ? BoxFit.cover : BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return _imageWidget(AssetImage(AppImages.noimage));
      },
    );
  }
}
