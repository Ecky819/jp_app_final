import 'dart:ui';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final bool withIcon;

  const CategoryChip({
    super.key,
    required this.label,
    required this.selected,
    this.withIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 0),
          child: Container(
            padding: withIcon
                ? const EdgeInsets.symmetric(horizontal: 16, vertical: 6)
                : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

            decoration: BoxDecoration(
              color: selected
                  ? const Color(0x9DFFFFFF)
                  : const Color(0x20FFFFFF),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: selected
                    ? const Color(0x80FFFFFF)
                    : const Color(0x60FFFFFF),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 4,
              children: [
                if (withIcon) ...[
                  Image.asset(
                    'assets/icons/lunch.png',
                    width: 16,
                    height: 16,
                    color: Colors.white54,
                  ),
                  //const SizedBox(width: 4),
                ],
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: selected
                        ? Colors.black
                        : Color.fromRGBO(235, 235, 245, 0.6),
                  ),
                ),
                if (withIcon) ...[
                  //const SizedBox(width: 4),
                  Icon(
                    Icons.expand_more,
                    //size: 24,
                    color: Colors.white54,
                    opticalSize: 16,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
