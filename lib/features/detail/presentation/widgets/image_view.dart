import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  String? imgUrl;

  ImageView(this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Image.network(
          imgUrl!,
          fit: BoxFit.cover,
        ));
  }
}
