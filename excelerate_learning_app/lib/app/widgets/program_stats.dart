import 'package:excelerate_learning_app/app/utils/app_colors.dart';
import 'package:excelerate_learning_app/features/home/model/program_model.dart';
import 'package:flutter/material.dart';

class ProgramStats extends StatelessWidget {
  final Program program;

  const ProgramStats({super.key, required this.program});

  Widget _buildStat(IconData icon, Color iconColor, String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor, size: 30),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 11),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStat(Icons.timer_outlined, AppColors.lightBlue, "Duration", program.duration),
          _buildStat(Icons.menu_book_outlined, AppColors.lightBlue, "Lessons", program.lessonsCount.toString()),
          _buildStat(Icons.star_rounded, AppColors.yellow, "Rating", program.rating.toString()),
          _buildStat(Icons.people_alt_outlined, AppColors.lightBlue, "Enrolled", program.enrolledCount.toString()),
        ],
      ),
    );
  }
}