import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Purple Bubble
        Positioned(
          top: -40,
          left: -30,
          child: _bubble(180, Colors.purple.shade200),
        ),

        // Cyan Bubble
        Positioned(
          top: 200,
          right: -20,
          child: _bubble(150, Colors.cyan.shade200),
        ),

        // Blue Bubble
        Positioned(
          bottom: -60,
          left: 100,
          child: _bubble(200, Colors.blue.shade200),
        ),

        child,
      ],
    );
  }

  Widget _bubble(double size, Color color) {
    return AnimatedContainer(
      duration: const Duration(seconds: 8),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
    );
  }
}
