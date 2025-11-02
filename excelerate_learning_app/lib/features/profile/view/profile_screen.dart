import 'package:excelerate_learning_app/app/widgets/enrollment_item.dart';
import 'package:excelerate_learning_app/app/widgets/stats_row.dart';
import 'package:excelerate_learning_app/app/widgets/user_card.dart';
import 'package:excelerate_learning_app/features/profile/view_model/profile_view_model.dart';
import 'package:excelerate_learning_app/features/programs/view_model/program_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileViewModel ctrl = Get.put(ProfileViewModel());
  final ProgramViewModel programVM = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.white,
        elevation: 0.4,
      ),
      body: Obx(() {
        final user = ctrl.user.value;

        if (user == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              UserCard(user: user),

              const SizedBox(height: 20),

              StatsRow(
                enrolled: ctrl.enrollments.length,
                completed: ctrl.completedCount,
                inProgress: ctrl.inProgressCount,
              ),

              const SizedBox(height: 25),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text("My Courses",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),

              if (ctrl.enrollments.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text("No enrollments yet.",
                      style: TextStyle(color: Colors.grey)),
                )
              else
                ...ctrl.enrollments.map((e) {
                  final program = programVM.findProgram(e.programId);
                  if (program == null) return const SizedBox();
                  return EnrollmentItem(enrollment: e, program: program);
                }),
            ],
          ),
        );
      }),
    );
  }
}
