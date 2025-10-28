import 'package:excelerate_learning_app/app/routes/app_routes.dart';
import 'package:excelerate_learning_app/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AuthViewModel auth = Get.find();
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Full name')),
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 12),
            Obx(() => ElevatedButton(
              onPressed: auth.isLoading.value ? null : () async {
                final u = await auth.signup(nameCtrl.text.trim(), emailCtrl.text.trim());
                if (u != null) {
                  Get.offAllNamed(Routes.HOME);
                }
              },
              child: auth.isLoading.value ? const CircularProgressIndicator(color: Colors.white) : const Text('Create Account'),
            )),
            TextButton(onPressed: () => Get.back(), child: const Text('Back to login'))
          ],
        ),
      ),
    );
  }
}
