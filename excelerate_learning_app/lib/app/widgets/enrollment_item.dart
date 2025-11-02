import 'package:excelerate_learning_app/features/enrollment/model/enrollment_model.dart';
import 'package:excelerate_learning_app/features/home/model/program_model.dart';
import 'package:flutter/material.dart';


class EnrollmentItem extends StatelessWidget {
  final EnrollmentModel enrollment;
  final Program program;

  const EnrollmentItem({
    super.key,
    required this.enrollment,
    required this.program,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(program.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(program.category, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 12),

          LinearProgressIndicator(
            value: enrollment.progress / 100,
            color: Colors.blue,
            backgroundColor: Colors.grey.shade300,
          ),

          const SizedBox(height: 8),
          Text("${enrollment.progress.toStringAsFixed(0)}% completed",
              style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
