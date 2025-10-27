class Lesson {
  final String id;
  final String programId;
  final String title;
  final String description;
  final String duration;
  final int order;

  Lesson({
    required this.id,
    required this.programId,
    required this.title,
    required this.description,
    required this.duration,
    required this.order,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      programId: json['programId'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      order: json['order'] ?? 0,
    );
  }
}
