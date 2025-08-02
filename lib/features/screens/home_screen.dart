import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildCategoryChip(
    String label,
    bool selected, {
    bool withIcon = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          // 30% Weiß = 0x4DFFFFFF, 15% Weiß = 0x26FFFFFF
          color: selected ? const Color(0x4DFFFFFF) : const Color(0x26FFFFFF),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            // 50% Weiß = 0x80FFFFFF, 30% Weiß = 0x4DFFFFFF
            color: selected ? const Color(0x80FFFFFF) : const Color(0x4DFFFFFF),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            if (withIcon) ...[
              const Icon(Icons.grid_view, size: 16, color: Colors.white70),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendCard({
    required String assetImage,
    required String title,
    required String subtitle,
    required String price,
    required int likes,
  }) {
    return Container(
      width: 200,
      height: 240,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [-0.2, 0.61, 1.0],
          colors: [Color(0x00FFFFFF), Color(0xFF908CF5), Color(0xFF8C5BEA)],
        ),
        borderRadius: BorderRadius.circular(24),
        // 50% Weiß = 0x80FFFFFF
        border: Border.all(color: const Color(0x80FFFFFF), width: 1),
        boxShadow: const [
          // 10% Weiß = 0x1AFFFFFF
          BoxShadow(
            color: Color(0x1AFFFFFF),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              assetImage,
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                price,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.favorite_border,
                color: Colors.white70,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                likes.toString(),
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/hintergründe/bg_mainscreen.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose Your\nFavorite Snack',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCategoryChip(
                          'All categories',
                          false,
                          withIcon: true,
                        ),
                        _buildCategoryChip('Salty', true),
                        _buildCategoryChip('Sweet', false),
                        _buildCategoryChip('Fruity', false),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          'assets/details/cut_card.png',
                          width: size.width * 0.88,
                        ),
                        Positioned(
                          top: 36,
                          left: 28,
                          child: SizedBox(
                            width: size.width * 0.45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Angi’s Yummy Burger',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Delish vegan burger\nthat tastes like heaven',
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'A 13.99',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/grafiken/star.png',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '4.8',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 48,
                          right: 4,
                          child: Image.asset(
                            'assets/grafiken/burger.png',
                            width: size.width * 0.52,
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 28,
                          child: Container(
                            width: 105,
                            height: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: const RadialGradient(
                                center: Alignment(-0.2, -0.6),
                                radius: 1.2,
                                colors: [Color(0xFF908CF5), Color(0xFFBB8DE1)],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                // 50% Schwarz = 0x80000000
                                BoxShadow(
                                  color: Color(0x80000000),
                                  offset: Offset(0, 2),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Text(
                              'Add to order',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'We Recommend',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 240,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildRecommendCard(
                          assetImage: 'assets/grafiken/cupkake_cat.png',
                          title: 'Mogli’s Cup',
                          subtitle: 'Strawberry ice cream',
                          price: 'A 8.99',
                          likes: 200,
                        ),
                        _buildRecommendCard(
                          assetImage: 'assets/grafiken/icecream.png',
                          title: 'Balu’s Cup',
                          subtitle: 'Pistachio ice cream',
                          price: 'A 8.99',
                          likes: 165,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
