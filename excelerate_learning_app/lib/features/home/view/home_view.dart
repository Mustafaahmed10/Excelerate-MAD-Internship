import 'package:excelerate_learning_app/app/widgets/program_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excelerate_learning_app/app/utils/app_colors.dart';
import 'package:excelerate_learning_app/app/widgets/app_logo.dart';
import 'package:excelerate_learning_app/features/home/view_model/home_view_model.dart';
import 'package:excelerate_learning_app/features/auth/view_model/auth_view_model.dart';
import 'package:excelerate_learning_app/app/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel ctrl = Get.find();
    final AuthViewModel auth = Get.find();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const AppLogo(size: 40),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => Get.toNamed(Routes.PROFILE),
          ),
          // IconButton(
          //   icon: const Icon(Icons.admin_panel_settings_outlined),
          //   onPressed: () => Get.toNamed(Routes.ADMIN),
          // ),
        ],
      ),
      body: Obx(() {
        if (ctrl.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 1000
                ? 4
                : constraints.maxWidth > 600
                    ? 2
                    : 1;

            final aspectRatio = constraints.maxWidth > 1000
                ? 0.9
                : constraints.maxWidth > 600
                    ? 0.8
                    : 0.7;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, ${auth.user.value?.name ?? 'Guest'} 👋',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Explore Programs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ctrl.programs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: aspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      final program = ctrl.programs[index];
                      return ProgramCard(program: program);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
