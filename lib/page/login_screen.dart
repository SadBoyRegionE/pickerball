import 'package:flutter/material.dart';
import 'home_page.dart';
import '../widget/button_primary.dart';
import '../widget/general_logo_space.dart';
import '../theme.dart';
import 'package:flutter_animate/flutter_animate.dart';  // Thêm thư viện animate

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,  // Đảm bảo màu nền trắng được áp dụng
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: Center(
        child: GeneralLogoSpace(
          ButtonPrimary(
            textLogin: "Login",
            textSignUp: "Sign Up",
            onTapLogin: () {
              // Khi nhấn nút Login, chuyển đến HomePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            onTapSignUp: () {
              print("Sign Up button pressed");
            },
          ).animate().fadeIn(duration: 300.ms).scaleXY(begin: 0.9, end: 1.0, duration: 300.ms), // Áp dụng hiệu ứng fadeIn và scale cho ButtonPrimary
        ).animate().fadeIn(duration: 500.ms).scaleXY(begin: 0.8, end: 1.0, duration: 500.ms), // Áp dụng hiệu ứng fadeIn và scale cho GeneralLogoSpace
      ),
    );
  }
}
