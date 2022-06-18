import 'package:flutter/material.dart';

class CoinImage extends StatelessWidget {
  final String? image;
  final Icon? icon;
  final Color? bgColor;

  CoinImage({this.image, this.icon, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor ?? Theme.of(context).cardColor,
      ),
      child: icon ?? Image.asset(image!),
    );
  }
}
