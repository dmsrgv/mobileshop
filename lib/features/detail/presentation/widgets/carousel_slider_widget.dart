import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobileshop/components/size_config.dart';
import 'package:mobileshop/features/detail/presentation/widgets/image_view.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    Key? key,
    required this.imagesList,
  }) : super(key: key);

  final List imagesList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: imagesList.length,
        itemBuilder: (context, index, page) {
          return ImageView(imagesList[index]);
        },
        options: CarouselOptions(
          autoPlay: true,
          height: SizeConfig.screenHeight! / 5,
        ));
  }
}
