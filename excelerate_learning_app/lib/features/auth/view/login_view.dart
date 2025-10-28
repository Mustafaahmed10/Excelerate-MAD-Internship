import 'package:excelerate_learning_app/app/routes/app_routes.dart';
import 'package:excelerate_learning_app/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthViewModel auth = Get.find();
    final TextEditingController emailCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 12),
            Obx(() => ElevatedButton(
              onPressed: auth.isLoading.value ? null : () async {
                final success = await auth.login(emailCtrl.text.trim());
                if (success) {
                  Get.offAllNamed(Routes.HOME);
                } else {
                  Get.snackbar('Login Failed', 'User not found');
                }
              },
              child: auth.isLoading.value ? const CircularProgressIndicator(color: Colors.white) : const Text('Sign In'),
            )),
            TextButton(onPressed: () => Get.toNamed(Routes.SIGNUP), child: const Text('Create account'))
          ],
        ),
      ),
    );
  }
}

