import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:jp_app/widgets/segmented_size_choice.dart';

class SnackOverlay extends StatefulWidget {
  final VoidCallback onClose;
  final String assetImage;
  final String title;
  final double price;
  final int likes;

  const SnackOverlay({
    super.key,
    required this.onClose,
    required this.assetImage,
    required this.title,
    required this.price,
    required this.likes,
  });

  @override
  State<SnackOverlay> createState() => _SnackOverlayState();
}

class _SnackOverlayState extends State<SnackOverlay> {
  int quantity = 1;
  String selectedSize = "Large";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(color: Colors.black.withValues(alpha: 0.6)),
          // Gradient background (80% of screen height)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(height: size.height),
          ),
          //Black-Background
          Positioned(
            top: 140,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(color: const Color(0xFF000000)),
          ),
          Positioned(child: Image.asset(widget.assetImage)),
          // Cupcake and selection options (layer 2)
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Size selection and quantity
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Size chips
                      Row(children: [SegmentedSizeChoice()]),
                      // Quantity controls
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: quantity > 1
                                  ? () {
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  : null,
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Icon(
                                  Icons.remove_circle_outline_outlined,
                                  color: quantity > 1
                                      ? Colors.white70
                                      : Colors.white30,
                                  size: 36,
                                ),
                              ),
                            ),
                            Container(
                              width: 28,
                              alignment: Alignment.center,
                              child: Text(
                                quantity.toString(),
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white70,
                                  size: 36,
                                  weight: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Add to order button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFE970C4), Color(0xFFF69EA3)],
                      ),
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [Color(0x80EA71C5), Color(0xFFFFACE4)],
                          begin: Alignment.center,
                          end: Alignment.center,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFEA71C5).withValues(alpha: 0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      onPressed: () => widget.onClose,
                      child: Text(
                        "Add to order for ₳ ${(widget.price * quantity).toStringAsFixed(2)}",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main content card (layer 3)
          Positioned(
            bottom: 200, // Adjust this value to set the overlap
            left: 20,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      // 10% Weiß = 0x1AFFFFFF
                      color: const Color(0x1AFFFFFF),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header with title and likes
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        spacing: 6,
                        children: [
                          const Icon(
                            Icons.favorite_border,
                            color: Color(0x90EBEBF5),
                            size: 18,
                          ),
                          Text(
                            '200',
                            style: const TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Color(0x90EBEBF5),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      //Title
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontFamily: 'Inter Black',
                              fontSize: 22,
                              letterSpacing: 0.35,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Description
                      Text(
                        'Lorem ipsum dolor sit amet consectetur. Non\n'
                        'feugiat imperdiet a vel sit at amet. Mi\n'
                        'accumsan feugiat magna aliquam feugiat ac\n'
                        'et. Pulvinar hendrerit id arcu at sed etiam\n'
                        'semper mi hendrerit. Id aliquet quis quam.',
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Color(0x90EBEBF5),
                          fontStyle: FontStyle.normal,
                          fontSize: 13,
                          height: 1.385,
                          letterSpacing: -0.08,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      // Price
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/currency.png',
                            width: 12,
                            height: 14,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            widget.price.toString(),
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Divider(height: 2, color: Color(0x50FFFFFF)),
                      const SizedBox(height: 24),
                      // Ingredients and Reviews
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Ingredients
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ingredients",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                spacing: 7,
                                children: [
                                  Image.asset(
                                    'assets/icons/no_gluten.png',
                                    cacheWidth: 19,
                                    cacheHeight: 19,
                                  ),
                                  Image.asset(
                                    'assets/icons/no_sugar.png',
                                    cacheWidth: 19,
                                    cacheHeight: 19,
                                  ),
                                  Image.asset(
                                    'assets/icons/low_fat.png',
                                    cacheWidth: 19,
                                    cacheHeight: 19,
                                  ),
                                  Image.asset(
                                    'assets/icons/kcal.png',
                                    cacheWidth: 19,
                                    cacheHeight: 19,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Reviews
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Reviews",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0x90EBEBF5),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  ...List.generate(
                                    4,
                                    (index) => const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star_border,
                                    size: 16,
                                    color: Color(0x90EBEBF5),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "4.0",
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      color: Color(0x90EBEBF5),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Close button
          Positioned(
            top: 145,
            right: 20,
            child: GestureDetector(
              onTap: widget.onClose,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.white70,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
