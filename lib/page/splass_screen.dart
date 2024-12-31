import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Import Lottie package
import 'login_screen.dart'; // Import đúng file login_screen.dart
import '/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Fade animation (opacity)
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Slide animation (Y-axis movement)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // Start position (above the screen)
      end: const Offset(0, 0), // End position (center of screen)
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start animation
    _controller.forward();

    // Navigate to LoginScreen after animation
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinkColor, // Màu nền cho SplashScreen
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SlideTransition(
                position: _slideAnimation,
                child: Center(
                  child: Transform.translate(
                    offset:
                        const Offset(0, 35), // Di chuyển logo xuống 30 pixel
                    child: Image.asset(
                      'assets/pages/logo.png', // Đường dẫn đến logo
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
              ),
            ),
            // Lottie animation below
            Expanded(
              flex: -1,
              child: Lottie.asset(
                'assets/animation/Foxhello.json', // Đường dẫn đến file Lottie
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
