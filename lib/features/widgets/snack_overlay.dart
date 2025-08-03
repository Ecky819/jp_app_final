import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackOverlay extends StatefulWidget {
  final VoidCallback onClose;

  const SnackOverlay({super.key, required this.onClose});

  @override
  State<SnackOverlay> createState() => _SnackOverlayState();
}

class _SnackOverlayState extends State<SnackOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  int quantity = 1;
  String selectedSize = "Large";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _closeOverlay() async {
    await _animationController.reverse();
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Semi-transparent background overlay
          GestureDetector(
            onTap: _closeOverlay,
            child: Container(
              color: Colors.black.withValues(alpha: 0.6),
              width: size.width,
              height: size.height,
            ),
          ),
          // Animated overlay container
          AnimatedBuilder(
            animation: _slideAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _slideAnimation.value * size.height * 0.5),
                child: Stack(
                  children: [
                    // Gradient background (80% of screen height)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: size.height * 0.8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              const Color(0xFFC78FFD).withValues(alpha: 0.2),
                              const Color(0xFFC78FFD).withValues(alpha: 0.8),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Cupcake and selection options (layer 2)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Cupcake image
                          Padding(
                            padding: const EdgeInsets.only(bottom: 200),
                            child: Center(
                              child: Container(
                                width: 300,
                                height: 300,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(150),
                                  child: Image.asset(
                                    'assets/images/cupcake_cat.png',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      // Fallback if image not found
                                      return Container(
                                        width: 300,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.orange.shade300,
                                              Colors.orange.shade600,
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            150,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.cake,
                                          size: 150,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                                Row(
                                  children: [
                                    _buildSizeChip(
                                      "Small",
                                      selectedSize == "Small",
                                    ),
                                    _buildSizeChip(
                                      "Medium",
                                      selectedSize == "Medium",
                                    ),
                                    _buildSizeChip(
                                      "Large",
                                      selectedSize == "Large",
                                    ),
                                  ],
                                ),
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
                                            borderRadius: BorderRadius.circular(
                                              18,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            color: quantity > 1
                                                ? Colors.white70
                                                : Colors.white30,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 28,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "$quantity",
                                          style: GoogleFonts.inter(
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
                                            borderRadius: BorderRadius.circular(
                                              18,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white70,
                                            size: 18,
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
                                  colors: [
                                    Color(0xFFEA71C5),
                                    Color(0xFFD946EF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(28),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFEA71C5,
                                    ).withValues(alpha: 0.4),
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
                                onPressed: () {
                                  // Add to order logic
                                  _closeOverlay();
                                },
                                child: Text(
                                  "Add to order for ₳ ${(8.99 * quantity).toStringAsFixed(2)}",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom + 16,
                          ),
                        ],
                      ),
                    ),
                    // Main content card (layer 3)
                    Positioned(
                      bottom: 250, // Adjust this value to set the overlap
                      left: 20,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.1),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Header with title and likes
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Mogli's Cup",
                                  style: GoogleFonts.inter(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.favorite_border,
                                        color: Colors.white70,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        '200',
                                        style: GoogleFonts.roboto(
                                          color: Colors.white70,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Description
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.",
                              style: GoogleFonts.roboto(
                                color: Colors.white70,
                                fontSize: 14,
                                height: 1.5,
                                letterSpacing: 0.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            // Price
                            Text(
                              "₳ 8.99",
                              style: GoogleFonts.inter(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.white.withValues(alpha: 0.3),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
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
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        _buildIngredientIcon(
                                          Icons.eco,
                                          Colors.green,
                                        ),
                                        _buildIngredientIcon(
                                          Icons.water_drop,
                                          Colors.blue,
                                        ),
                                        _buildIngredientIcon(
                                          Icons.grain,
                                          Colors.orange,
                                        ),
                                        _buildIngredientIcon(
                                          Icons.local_fire_department,
                                          Colors.red,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Reviews
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Reviews",
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        ...List.generate(
                                          4,
                                          (index) => const Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.star_border,
                                          size: 20,
                                          color: Colors.white54,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          "4.0",
                                          style: GoogleFonts.roboto(
                                            color: Colors.white70,
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
                    // Close button
                    Positioned(
                      top: 40,
                      right: 40,
                      child: GestureDetector(
                        onTap: _closeOverlay,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white70,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSizeChip(String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedSize = label;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: selected
                ? Colors.white.withValues(alpha: 0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected
                  ? Colors.white.withValues(alpha: 0.6)
                  : Colors.white.withValues(alpha: 0.3),
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                color: selected ? Colors.white : Colors.white70,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIngredientIcon(IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.4), width: 1),
        ),
        child: Icon(icon, size: 16, color: color),
      ),
    );
  }
}
