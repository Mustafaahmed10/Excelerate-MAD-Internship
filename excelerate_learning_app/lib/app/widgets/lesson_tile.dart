import 'package:excelerate_learning_app/features/programs/model/lesson_model.dart';
import 'package:flutter/material.dart';

class LessonTile extends StatelessWidget {
  final Lesson lesson;
  final int index;

  const LessonTile({required this.lesson, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 2,
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16, 
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[50],
          child: Text(index.toString(),
              style: const TextStyle(color: Colors.blue,)),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(lesson.title,
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
        ),
        subtitle: Text(lesson.description,style:TextStyle(fontSize: 12, color: Colors.grey[600])),
        trailing: Text(lesson.duration,
            style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ),
    );
  }
}
