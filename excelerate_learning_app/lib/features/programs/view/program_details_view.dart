import 'package:excelerate_learning_app/app/utils/app_colors.dart';
import 'package:excelerate_learning_app/app/widgets/instructor_section.dart';
import 'package:excelerate_learning_app/app/widgets/lesson_tile.dart';
import 'package:excelerate_learning_app/app/widgets/program_description_section.dart';
import 'package:excelerate_learning_app/app/widgets/program_header.dart';
import 'package:excelerate_learning_app/app/widgets/program_stats.dart';
import 'package:excelerate_learning_app/features/home/model/program_model.dart';
import 'package:excelerate_learning_app/features/programs/view_model/program_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final Program program;

  ProgramDetailsScreen({super.key}) : program = Get.arguments as Program;

  @override
  Widget build(BuildContext context) {
    final ProgramViewModel ctrl = Get.find();
    final lessons = ctrl.lessonsForProgram(program.id);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgramHeader(program: program),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProgramStats(program: program),
                  const SizedBox(height: 25),
                  ProgramDescriptionSection(program: program),
                  const SizedBox(height: 30),
                  InstructorSection(program: program),
                  const SizedBox(height: 35),
                  Text(
                    "Lessons",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (lessons.isEmpty)
                    const Text("No lessons available for this program."),
                  ...lessons.asMap().entries.map((entry) {
                    final index = entry.key + 1;
                    final lesson = entry.value;
                    return LessonTile(lesson: lesson, index: index);
                  }),

                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Enroll Now"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
