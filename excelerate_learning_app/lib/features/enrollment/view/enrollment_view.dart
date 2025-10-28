import 'package:excelerate_learning_app/features/enrollment/view_model/enrollment_view_model.dart';
import 'package:excelerate_learning_app/features/programs/view_model/program_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EnrollmentView extends StatelessWidget {
  final String programId;
  const EnrollmentView({required this.programId, super.key});

  @override
  Widget build(BuildContext context) {
    final ProgramViewModel pc = Get.find();
    final EnrollmentViewModel ec = Get.find();
    final program = pc.findProgram(programId);
    final lessons = pc.lessonsForProgram(programId);
    final enrollment = ec.findForProgram(programId);

    if (program == null) {
      return Scaffold(appBar: AppBar(), body: const Center(child: Text('Program not found')));
    }

    return Scaffold(
      appBar: AppBar(title: Text(program.title)),
      body: Obx(() {
        final e = ec.findForProgram(programId);
        final completed = e?.completedLessons.length ?? 0;
        final total = lessons.length;
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Progress: ${e?.progress?.toStringAsFixed(0) ?? '0'}%'),
            const SizedBox(height: 8),
            ...lessons.map((l) {
              final done = e?.completedLessons.contains(l.id) ?? false;
              return ListTile(
                leading: Icon(done ? Icons.check_circle : Icons.circle_outlined, color: done ? Colors.green : null),
                title: Text(l.title),
                subtitle: Text(l.duration),
                onTap: () {
                  ec.toggleLesson(programId, l.id, total);
                },
              );
            }),
            if (e != null && e.completedLessons.length == total)
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/feedback/${programId}');
                },
                child: const Text('Complete Course & Leave Feedback'),
              )
          ],
        );
      }),
    );
  }
}
