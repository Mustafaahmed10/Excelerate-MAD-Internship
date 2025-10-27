import 'package:excelerate_learning_app/features/programs/view%20model/program_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProgramDetailsScreen extends StatelessWidget {
  final String programId;
  ProgramDetailsScreen({required this.programId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProgramViewModel());
    return Scaffold(
      appBar: AppBar(title: Text('Program Details')),
      body: Obx(() {
        final lessons = controller.lessons;
        return ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            return ListTile(title: Text(lesson.title));
          },
        );
      }),
    );
  }
}
