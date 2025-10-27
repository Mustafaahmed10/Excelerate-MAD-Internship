import 'package:excelerate_learning_app/features/programs/view%20model/program_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramListScreen extends StatelessWidget {
  const ProgramListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProgramViewModel ctrl = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text('Programs')),
      body: Obx(() {
        if (ctrl.isLoading.value) return const Center(child: CircularProgressIndicator());
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: ctrl.programs.length,
          itemBuilder: (context, idx) {
            final p = ctrl.programs[idx];
            return Card(
              child: ListTile(
                leading: Image.network(p.image, width: 72, fit: BoxFit.cover),
                title: Text(p.title),
                subtitle: Text('${p.category} • ${p.duration}'),
                onTap: () => Get.toNamed('/program/${p.id}'),
              ),
            );
          },
        );
      }),
    );
  }
}
