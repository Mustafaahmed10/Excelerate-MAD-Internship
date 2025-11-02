import 'package:excelerate_learning_app/app/routes/app_routes.dart';
import 'package:excelerate_learning_app/app/widgets/app_logo.dart';
import 'package:excelerate_learning_app/app/widgets/auth_background.dart';
import 'package:excelerate_learning_app/app/widgets/auth_card.dart';
import 'package:excelerate_learning_app/app/widgets/gradient_text.dart';
import 'package:excelerate_learning_app/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthViewModel auth = Get.find();

    return Scaffold(
      body: AuthBackground(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const AppLogo(size: 90),

                const SizedBox(height: 16),
                const GradientText(
                  text: "Continuous Learning & Upskilling",
                  fontSize: 16,
                ),
                const SizedBox(height: 20),

                AuthCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Enter your email to access your account",
                        style: TextStyle(color: Colors.grey),
                      ),

                      const SizedBox(height: 20),

                      //Email
                      TextField(
                        controller: emailCtrl,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      //Password
                      TextField(
                        controller: passCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Obx(() {
                        return ElevatedButton(
                          onPressed:
                              auth.isLoading.value
                                  ? null
                                  : () async {
                                    final ok = await auth.login(
                                      emailCtrl.text.trim(),
                                      passCtrl.text.trim(),
                                    );

                                    if (ok) {
                                      Get.offAllNamed(Routes.HOME);
                                    } else {
                                      Get.snackbar(
                                        "Login failed",
                                        "User not found",
                                      );
                                    }
                                  },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child:
                              auth.isLoading.value
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : const Text("Sign In"),
                        );
                      }),

                      const SizedBox(height: 20),

                      // const Center(
                      //   child: Text(
                      //     "Quick Demo Access",
                      //     style: TextStyle(color: Colors.grey),
                      //   ),
                      // ),
                      // const SizedBox(height: 10),

                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: OutlinedButton(
                      //         onPressed: () => auth.login("learner@demo.com"),
                      //         child: const Text("Learner Demo"),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 10),
                      //     Expanded(
                      //       child: OutlinedButton(
                      //         onPressed:
                      //             () => auth.login("admin@excelerate.com"),
                      //         child: const Text("Admin Demo"),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.SIGNUP),
                  child: const Text("Create an account"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
