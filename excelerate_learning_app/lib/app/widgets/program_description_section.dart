import 'package:excelerate_learning_app/features/home/model/program_model.dart';
import 'package:flutter/material.dart';

class ProgramDescriptionSection extends StatelessWidget {
  final Program program;

  const ProgramDescriptionSection({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("About This Program",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(program.description, style: const TextStyle(fontSize: 14,color: Color.fromARGB(117, 0, 0, 0))),
        const SizedBox(height: 20),
        const Text("Learning Outcomes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text("What you'll learn in this program",
            style: TextStyle(fontSize: 14, color:  Color.fromARGB(117, 0, 0, 0))),
        const SizedBox(height: 15),
        ...program.learningOutcomes.map((outcome) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle, size: 18, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(child: Text(outcome)),
                ],
              ),
            )),
      ],
    );
  }
}
