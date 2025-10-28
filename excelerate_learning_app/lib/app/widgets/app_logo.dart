import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AppLogo extends StatelessWidget {
  final String text;
  final double size;
  final bool animated;

  const AppLogo({
    super.key,
    this.text = "Excelerate",
    this.size = 48,
    this.animated = true,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = size * 0.5;
    final borderRadius = size * 0.25;

    final logo = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(
              LucideIcons.sparkles,
              color: Colors.white,
              size: iconSize,
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            left: 4,
            child: Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Colors.pinkAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );

    final animatedLogo = animated
        ? logo
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
            .scale(begin: const Offset(1, 1), end: const Offset(1.05, 1.05))
            .rotate(begin: 0, end: 0.03, duration: 900.ms)
        : logo;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        animatedLogo,
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: size * 0.5,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
              ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
          ),
        )
            .animate()
            .fadeIn(duration: 500.ms)
            .slideX(begin: -0.2, duration: 500.ms),
      ],
    );
  }
}
