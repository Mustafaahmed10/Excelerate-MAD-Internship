import 'package:flutter/material.dart';
import 'stat_card.dart';

class StatsRow extends StatelessWidget {
  final int enrolled;
  final int completed;
  final int inProgress;

  const StatsRow({
    super.key,
    required this.enrolled,
    required this.completed,
    required this.inProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatCard(
            label: "Enrolled",
            value: enrolled,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            label: "Completed",
            value: completed,
            color: Colors.yellow,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            label: "In Progress",
            value: inProgress,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
