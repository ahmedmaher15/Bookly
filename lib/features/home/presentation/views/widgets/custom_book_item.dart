import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.image});
  final String?image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7/4,
      child: Container(
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image:  DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                 image?? AssetsData.testImage,
                ))),
      ),
    );
  }
}
