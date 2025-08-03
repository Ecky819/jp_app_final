import 'dart:ui';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow_update/flutter_inset_box_shadow_update.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:google_fonts/google_fonts.dart';

class _GlassCard extends StatelessWidget {
  const _GlassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 25,
      bottom: 103,
      width: 340,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: const Color(0x1AFFFFFF), width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                SizedBox(
                  width: 200,
                  height: 48,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                    child: Ink(
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
                            color: Color(0xFFFFACE4),
                            offset: Offset(0, 25),
                            blurRadius: 90,
                            spreadRadius: 0.0,
                          ),
                          BoxShadow(
                            inset: false,
                            color: Color(0x80EA71C5),
                            offset: Offset(0, 30),
                            blurRadius: 70,
                            spreadRadius: 0,
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
    );
  }
}
