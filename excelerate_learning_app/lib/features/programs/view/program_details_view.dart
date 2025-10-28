import 'package:excelerate_learning_app/features/programs/view_model/program_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProgramDetailsScreen extends StatelessWidget {
  final String programId;
  const ProgramDetailsScreen({required this.programId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProgramViewModel>();
    final program = controller.findProgram(programId);

    return Scaffold(
      appBar: AppBar(title: Text(program?.title ?? 'Program Details')),
      body: Obx(() {
        final lessons = controller.lessonsForProgram(programId);

        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (lessons.isEmpty) {
          return const Center(child: Text('No lessons available for this program.'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            return Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(lesson.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(lesson.description),
                ),
                trailing: Text(
                  lesson.duration,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
