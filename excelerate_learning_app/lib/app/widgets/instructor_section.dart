import 'package:excelerate_learning_app/features/home/model/program_model.dart';
import 'package:flutter/material.dart';

class InstructorSection extends StatelessWidget {
  final Program program;

  const InstructorSection({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: program.instructorAvatar != null
              ? NetworkImage(program.instructorAvatar!)
              : const AssetImage('assets/images/instructor_placeholder.png')
                  as ImageProvider,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              program.instructor,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text('Course Instructor',
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
