import 'dart:ui';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1) Fullscreen-Hintergrund
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/bg_startscreen.png',
              fit: BoxFit.cover,
            ),
          ),
          // 2) Cupcake
          Positioned(
            top: 100,
            left: -35,
            right: -136,
            child: Image.asset(
              'assets/images/cupcake_chick.png',
              fit: BoxFit.contain,
            ),
          ),
          // 3) SNACK-Typo – voll im Vordergrund
          Positioned(
            top: 460,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/details/snack_snack.png',
              fit: BoxFit.contain,
              color: Colors.white.withValues(alpha: 0.40),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          // 4) Glass-Card (78 dp unten)
          Positioned(
            left: 24,
            right: 24,
            bottom: 86,
            height: 208,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 28,
                  ),
                  decoration: BoxDecoration(
                    // komplett transparent, nur Blur
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    // ultrafeiner Rahmen
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.10),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 75,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Überschrift in Inter
                            Text(
                              'Feeling Snackish Today?', // (h: ${size.height}, w: ${size.width})',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontStyle: FontStyle.normal,
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                            // Beschreibung in SF Pro Text Regular
                            Text(
                              'Explore Angi\'s most popular snack selection\nand get instantly happy.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                //fontWeight: FontWeight.w300,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Order Now-Button
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/home'),
                        child: Container(
                          width: 202, // etwas breiter
                          height: 48, // fixe Höhe
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // Verlauf umgedreht
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFE970C4), Color(0xFFF69EA3)],
                            ),
                            borderRadius: BorderRadius.circular(8), // 8 dp
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.30),
                              width: 1.5, // feiner
                            ),
                            boxShadow: [
                              // nur der weiche Glow
                              BoxShadow(
                                color: const Color(
                                  0xFFEA71C5,
                                ).withValues(alpha: 0.5),
                                offset: const Offset(0, 30),
                                blurRadius: 90,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Text(
                            'Order Now',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
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
