import 'package:booklykian/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage(AssetsData.testImage2),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
