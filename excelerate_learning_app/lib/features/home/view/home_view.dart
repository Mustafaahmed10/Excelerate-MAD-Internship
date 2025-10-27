import 'package:excelerate_learning_app/app/routes/app_routes.dart';
import 'package:excelerate_learning_app/features/auth/view%20model/auth_view_model.dart';
import 'package:excelerate_learning_app/features/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel ctrl = Get.find();
    final AuthViewModel auth = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excelerate Home'),
        actions: [
          IconButton(icon: const Icon(Icons.person), onPressed: () => Get.toNamed(Routes.PROFILE)),
          IconButton(icon: const Icon(Icons.admin_panel_settings), onPressed: () => Get.toNamed(Routes.ADMIN)),
        ],
      ),
      body: Obx(() {
        if (ctrl.isLoading.value) return const Center(child: CircularProgressIndicator());
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Welcome, ${auth.user.value?.name ?? 'Guest'}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            const Text('Featured Programs', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            ...ctrl.featured.map((p) => Card(
              child: ListTile(
                leading: Image.network(p.image, width: 72, fit: BoxFit.cover),
                title: Text(p.title),
                subtitle: Text('${p.category} • ${p.duration}'),
                onTap: () => Get.toNamed('/program/${p.id}'),
              ),
            )),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => Get.toNamed(Routes.PROGRAMS), child: const Text('Browse all programs')),
          ],
        );
      }),
    );
  }
}
