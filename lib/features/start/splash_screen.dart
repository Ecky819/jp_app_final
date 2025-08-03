import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jp_app/features/start/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideOutAnimation;
  late Animation<Offset> _slideInAnimation;
  bool _showNewContent = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideOutAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.0), //nach unten
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideInAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), //nach oben
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startTransition() async {
    //Content von oben nach unten rausschieben
    await _controller.forward();

    //pause vor dem Einschieben
    await Future.delayed(const Duration(milliseconds: 700)); //1,5 Sek?

    //controller zurücksetzen für nächste Animation
    _controller.reset();

    //neuen hintergrund zeigen
    setState(() {
      _showNewContent = true;
    });

    //neuen Content einschieben
    await _controller.forward();

    //Navigation
    if (mounted) {
      //Navigator.pushNamed(context, '/home');
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, _) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Fullscren-Hintergrund
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/bg_splashscreen.png',
              fit: BoxFit.cover,
            ),
          ),
          //Animierter Content
          SlideTransition(
            position: _showNewContent ? _slideInAnimation : _slideOutAnimation,
            child: _showNewContent
                ? _buildNewContent()
                : _buildOriginalContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildOriginalContent() {
    return Stack(
      children: [
        //Fullscren-Hintergrund
        Positioned.fill(
          child: Image.asset(
            'assets/backgrounds/bg_startscreen.png',
            fit: BoxFit.cover,
          ),
        ),
        //Cupcake
        Positioned(
          top: 100,
          left: -35,
          right: -136,
          child: Image.asset(
            'assets/images/cupcake_chick.png',
            fit: BoxFit.contain,
          ),
        ),
        //SNACK-Typo – voll im Vordergrund
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
        //Glass-Card
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
                          //Überschrift in Inter
                          Text(
                            'Feeling Snackish Today?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontStyle: FontStyle.normal,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          //Beschreibung in SF Pro Text Regular
                          Text(
                            'Explore Angi\'s most popular snack selection\nand get instantly happy.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontStyle: FontStyle.normal,
                              fontSize: 13,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Order Now-Button
                    GestureDetector(
                      onTap: () => _startTransition(),
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
    );
  }

  Widget _buildNewContent() {
    return HomeScreen.buildBodyContent();
  }
}
