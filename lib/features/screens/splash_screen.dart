import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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

          // 2) Cupcake – heroisch groß und zentriert
          Positioned(
            top: size.height * 0.08,
            left: -size.width * 0.05,
            right: -size.width * 0.30,
            child: Image.asset(
              'assets/images/cupcake_chick.png',
              width: size.width * 1.42,
              height: size.height * 0.714,
              fit: BoxFit.contain,
            ),
          ),

          // 3) SNACK-Typo – voll im Vordergrund
          Positioned(
            top: size.height * 0.50,
            left: -size.width * 0.05,
            right: -size.width * 0.05,
            child: Image.asset(
              'assets/details/snack_snack.png',
              width: size.width * 1.20,
              fit: BoxFit.contain,
            ),
          ),

          // 4) Glass-Card exakt Figma-Größe und -Position
          Positioned(
            left: 25,
            bottom: 78,
            width: 340,
            height: 208,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 28,
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
                  // die Column nur so hoch wie nötig
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Überschrift
                      Text(
                        'Feeling Snackish Today?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Beschreibung
                      Text(
                        'Explore Angi’s most popular snack selection\nand get instantly happy.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // ▶ Order Now als TextButton + Ink
                      SizedBox(
                        width: 220,
                        height: 48,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () =>
                              Navigator.pushNamed(context, '/home'),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFFE970C4), Color(0xFFF69EA3)],
                              ),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                // 30% Weiß = 0x4DFFFFFF
                                color: const Color(0x4DFFFFFF),
                                width: 1.5,
                              ),
                              boxShadow: const [
                                // 50% von #EA71C5 = 0x80EA71C5
                                BoxShadow(
                                  color: Color(0x80EA71C5),
                                  offset: Offset(0, 30),
                                  blurRadius: 90,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Order Now',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
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
