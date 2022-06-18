import 'package:flutter/material.dart';

class CurvedImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final double radius;

  CurvedImage(
    this.image, {
    this.height,
    this.width,
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        image,
        height: height,
        width: width ?? height,
        fit: BoxFit.fill,
      ),
    );
  }
}
