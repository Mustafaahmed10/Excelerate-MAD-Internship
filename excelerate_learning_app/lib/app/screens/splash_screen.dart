import 'dart:math';
import 'package:excelerate_learning_app/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(const Duration(seconds: 2));

    final auth = Get.find<AuthViewModel>();
    auth.tryAutoLogin();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _particle() {
    final random = Random();
    return Positioned(
      left: random.nextDouble() * Get.width,
      top: random.nextDouble() * Get.height,
      child: AnimatedOpacity(
        duration: Duration(seconds: 2 + random.nextInt(2)),
        opacity: random.nextDouble(),
        child: Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Main gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF7C3AED),
                  Color(0xFF2563EB),
                  Color(0xFF06B6D4),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          //Rotating gradient overlay
          AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: child,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade200.withOpacity(0.25),
                    Colors.transparent,
                    Colors.cyan.shade200.withOpacity(0.25),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          //Floating particles
          ...List.generate(12, (_) => _particle()),

          // ✅ Center content — NOTHING ANIMATES HERE
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //STATIC logo container 
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white24),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 22,
                        color: Colors.black.withOpacity(0.15),
                      )
                    ],
                  ),
                  child: const AppLogo(size: 70), 
                ),

                const SizedBox(height: 30),

                const Text(
                  "Welcome to Excelerate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Empowering your learning journey",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
