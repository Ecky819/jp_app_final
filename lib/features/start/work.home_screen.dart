import 'dart:ui';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow_update/flutter_inset_box_shadow_update.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildCategoryChip(
    String label,
    bool selected, {
    bool withIcon = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
              children: [
                if (withIcon) ...[
                  Image.asset(
                    'assets/icons/lunch.png',
                    width: 16,
                    height: 16,
                    color: Colors.white54,
                  ),
                  const SizedBox(width: 4),
                ],
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: "SF Pro Display Semibold",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: selected
                        ? Colors.black
                        : Color.fromRGBO(235, 235, 245, 0.6),
                  ),
                ),
                const SizedBox(width: 4),
                if (withIcon) ...[
                  Icon(Icons.expand_more, size: 20, color: Colors.white54),
                ],
              ],
            ),
          ),
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
        border: Border.all(color: const Color(0x80FFFFFF), width: 1),
        boxShadow: const [
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
              width: 160,
              height: 160,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontStyle: FontStyle.normal,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontStyle: FontStyle.normal,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Image.asset('assets/icons/currency.png', width: 15, height: 15),
              Text(
                price,
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
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
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
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
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/bg_mainscreen.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.transparent,
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose Your Favorite Snack',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
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
                              'assets/details/cut_card_shiny.png',
                              width: size.width * 0.88,
                            ),
                            Positioned(
                              top: 16,
                              left: 28,
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Angi’s Yummy Burger',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Delish vegan burger\nthat tastes like heaven',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Disply',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    const SizedBox(height: 12),

                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/currency.png',
                                          width: 18,
                                          height: 18,
                                        ),
                                        Text(
                                          ' 13.99',
                                          style: TextStyle(
                                            fontFamily: 'SF Pro Disply',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
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
                                    'assets/images/star.png',
                                    width: 12,
                                    height: 12,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '4.8',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Disply',
                                      fontSize: 11,
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
                                'assets/images/burger.png',
                                width: size.width * 0.52,
                              ),
                            ),
                            Positioned(
                              bottom: 25,
                              left: 28,
                              child: Container(
                                width: 105,
                                height: 36,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: const RadialGradient(
                                    center: Alignment(-0.2, -0.6),
                                    radius: 1.2,
                                    colors: [
                                      Color(0xFF908CF5),
                                      Color(0xFFBB8DE1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      inset: true,
                                      color: Color(0xFF9375B6),
                                      offset: Offset(0, -3),
                                      blurRadius: 24,
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                      inset: true,
                                      color: Color(0xFFFFACE4),
                                      offset: Offset(0, 0),
                                      blurRadius: 15,
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                      inset: false,
                                      color: Color(0x80EA71C5),
                                      offset: Offset(0, 30),
                                      blurRadius: 90,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'Add to order',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35),
                      Text(
                        'We Recommend',
                        style: TextStyle(
                          fontFamily: 'Inter Black',
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 265,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildRecommendCard(
                              assetImage: 'assets/images/cupcake_cat.png',
                              title: 'Mogli’s Cup',
                              subtitle: 'Strawberry ice cream',
                              price: ' 8.99',
                              likes: 200,
                            ),
                            _buildRecommendCard(
                              assetImage: 'assets/images/icecream.png',
                              title: 'Balu’s Cup',
                              subtitle: 'Pistachio ice cream',
                              price: ' 8.99',
                              likes: 165,
                            ),
                            _buildRecommendCard(
                              assetImage: 'assets/images/icecream_stick.png',
                              title: 'Smiling David',
                              subtitle: 'Coffee ice cream',
                              price: ' 3.99',
                              likes: 310,
                            ),
                            _buildRecommendCard(
                              assetImage: 'assets/images/icecream_cone.png',
                              title: 'Kai in a Cone',
                              subtitle: 'Vanilla ice cream',
                              price: ' 3.99',
                              likes: 290,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
