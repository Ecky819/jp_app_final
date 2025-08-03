import 'package:flutter/material.dart';

class _HeroImage extends StatelessWidget {
  final String imagePath;
  final double topFactor;
  final double leftFactor;
  final double rightFactor;
  final double widthFactor;
  final double heightFactor;

  const _HeroImage({
    required this.imagePath,
    required this.topFactor,
    required this.leftFactor,
    required this.rightFactor,
    required this.widthFactor,
    required this.heightFactor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * topFactor,
      left: -size.width * leftFactor,
      right: -size.width * rightFactor,
      child: Image.asset(
        imagePath,
        width: size.width * widthFactor,
        height: size.height * heightFactor,
        fit: BoxFit.contain,
      ),
    );
  }
}
