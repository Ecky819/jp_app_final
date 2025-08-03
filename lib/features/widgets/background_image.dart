import 'package:flutter/material.dart';

class _BackgroundImage extends StatelessWidget {
  final String imagePath;

  const _BackgroundImage({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover));
  }
}
