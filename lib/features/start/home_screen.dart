import 'dart:ui';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import 'package:flutter_inset_box_shadow_update/flutter_inset_box_shadow_update.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jp_app/widgets/category_chip.dart';
import 'package:jp_app/widgets/recommend_card.dart';
import 'package:jp_app/widgets/snack_overlay.dart';

class HomeScreen extends StatefulWidget {
  static final GlobalKey<_HomeScreenState> _globalKey = GlobalKey();

  HomeScreen() : super(key: _globalKey);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static String _assetImage = '';
  static String _title = '';
  static double _price = 0.00;
  static int _likes = 0;

  static void loadOverlay(
    String assetImage,
    String title,
    double price,
    int likes,
  ) {
    _assetImage = assetImage;
    _title = title;
    _price = price;
    _likes = likes;
    _globalKey.currentState?._openOverlay();
  }

  static void closeOverlay() {
    _globalKey.currentState?._closeOverlay();
  }

  static Widget buildBodyContent() {
    return Stack(
      children: [
        //Fullscren-Hintergrund
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
                  horizontal: 20,
                  vertical: 14,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose Your Favorite\nSnack',
                      style: TextStyle(
                        fontFamily: 'Inter Black',
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const CategoryChip(
                            label: 'All categories',
                            selected: false,
                            withIcon: true,
                          ),
                          const CategoryChip(
                            label: '  Salty  ',
                            selected: true,
                          ),
                          const CategoryChip(
                            label: '  Sweet  ',
                            selected: false,
                          ),
                          const CategoryChip(
                            label: '  Drinks  ',
                            selected: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 45),
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.asset(
                                  'assets/details/cut_card.png',
                                  color: Colors.grey.withValues(alpha: 0.4),
                                  colorBlendMode: BlendMode.modulate,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: SizedBox(
                                width: 363,
                                height: 250,
                                child: SvgPicture.asset(
                                  'assets/details/cut_card.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
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
                                  const SizedBox(height: 16),

                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/currency.png',
                                        width: 15,
                                        height: 15,
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
                            right: 28,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/star.png',
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
                              cacheWidth: 217,
                              cacheHeight: 217,
                            ),
                          ),
                          Positioned(
                            bottom: 38,
                            left: 28,
                            child: Container(
                              width: 93,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
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
                                    color: Color(0xFFFFACE4),
                                    offset: Offset(0, 0),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                  ),
                                  BoxShadow(
                                    inset: true,
                                    color: Color(0xFF9375B6),
                                    offset: Offset(-1, 0),
                                    blurRadius: 25,
                                    spreadRadius: 0,
                                  ),
                                  BoxShadow(
                                    inset: true,
                                    color: Color(0xFFFFACE4),
                                    offset: Offset(0, 0),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                  ),
                                  BoxShadow(
                                    inset: false,
                                    color: Color(0x80EA71C5),
                                    offset: Offset(0, 10),
                                    blurRadius: 40,
                                    spreadRadius: 8,
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
                    const SizedBox(height: 40),
                    Text(
                      'We Recommend',
                      style: TextStyle(
                        fontFamily: 'Inter Black',
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 272,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          RecommendCard(
                            assetImage: 'assets/images/cupcake_cat.png',
                            title: 'Mogli’s Cup',
                            subtitle: 'Strawberry ice cream',
                            price: ' 8.99',
                            likes: 200,
                            onItemTap: () => loadOverlay(
                              'assets/images/cupcake_cat.png',
                              'Mogli’s Cup',
                              8.99,
                              200,
                            ),
                          ),
                          RecommendCard(
                            assetImage: 'assets/images/icecream.png',
                            title: 'Balu’s Cup',
                            subtitle: 'Pistachio ice cream',
                            price: ' 8.99',
                            likes: 165,
                            onItemTap: () => loadOverlay(
                              'assets/images/icecream.png',
                              'Balu’s Cup',
                              8.99,
                              165,
                            ),
                          ),
                          RecommendCard(
                            assetImage: 'assets/images/icecream_stick.png',
                            title: 'Smiling David',
                            subtitle: 'Coffee ice cream',
                            price: ' 3.99',
                            likes: 310,
                            onItemTap: () => loadOverlay(
                              'assets/images/icecream_stick.png',
                              'Smiling David',
                              3.99,
                              310,
                            ),
                          ),
                          RecommendCard(
                            assetImage: 'assets/images/icecream_cone.png',
                            title: 'Kai in a Cone',
                            subtitle: 'Vanilla ice cream',
                            price: ' 3.99',
                            likes: 290,
                            onItemTap: () => loadOverlay(
                              'assets/images/icecream_cone.png',
                              'Kai in a Cone',
                              3.99,
                              290,
                            ),
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
        if (_globalKey.currentState?._isOverlayOpen == true)
          SlideTransition(
            position: _globalKey.currentState!._overlaySlideIn,
            child: SnackOverlay(
              onClose: () => closeOverlay(),
              assetImage: HomeScreen._assetImage,
              title: HomeScreen._title,
              price: HomeScreen._price,
              likes: HomeScreen._likes,
            ),
          ),
      ],
    );
  }
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _overlayController;
  late Animation<Offset> _overlaySlideIn;
  bool _isOverlayOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeScreen.buildBodyContent());
  }

  @override
  void initState() {
    super.initState();
    _overlayController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _overlaySlideIn =
        Tween<Offset>(
          begin: const Offset(0.0, 1.0), //Slide nach oben
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: _overlayController, curve: Curves.easeIn),
        );
  }

  @override
  void dispose() {
    _overlayController.dispose();
    super.dispose();
  }

  void _openOverlay() async {
    setState(() {
      _isOverlayOpen = true;
    });
    await _overlayController.forward();
  }

  void _closeOverlay() async {
    await _overlayController.reverse();
    setState(() {
      _isOverlayOpen = false;
    });
  }
}
