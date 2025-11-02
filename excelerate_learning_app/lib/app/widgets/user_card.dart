import 'package:excelerate_learning_app/features/auth/model/user_model.dart';
import 'package:excelerate_learning_app/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final AuthViewModel auth = Get.find();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Row(
        children: [
          // ✅ Avatar
          CircleAvatar(
            radius: 32,
            backgroundImage:
                user.avatar != null ? NetworkImage(user.avatar!) : null,
            child: user.avatar == null
                ? Text(
                    user.name.characters.first.toUpperCase(),
                    style: const TextStyle(fontSize: 28),
                  )
                : null,
          ),

          const SizedBox(width: 16),

          // ✅ User info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(user.email, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 4),

                // ✅ Role badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: user.role == "admin"
                        ? Colors.red.shade100
                        : Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(user.role),
                ),
              ],
            ),
          ),

          // ✅ Logout icon
          IconButton(
            onPressed: () => auth.logout(),
            icon: const Icon(Icons.logout, color: Colors.red),
          )
        ],
      ),
    );
  }
}
