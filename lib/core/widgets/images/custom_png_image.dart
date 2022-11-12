import 'package:flutter/material.dart';

import '../../utils/app_sizes.dart';

class CustomPngImage extends StatelessWidget {
  const CustomPngImage({
    Key? key,
    required this.path,
    this.height,
    this.width,
    this.radius,
  }) : super(key: key);

  CustomPngImage.square({
    Key? key,
    required String path,
    double? height,
    double? width,
  }) : this(
          key: key,
          path: path,
          height: height ?? AppSizes.imageWidthMedium,
          width: width ?? AppSizes.imageWidthMedium,
          radius: BorderRadius.circular(AppSizes.br8),
        );

  final String path;
  final double? height;
  final double? width;

  final BorderRadius? radius;

  /// check radius
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image.asset(
        path,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
}
