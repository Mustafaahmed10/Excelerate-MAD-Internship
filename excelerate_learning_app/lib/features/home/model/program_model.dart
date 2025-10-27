class Program {
  final String id;
  final String title;
  final String category;
  final String difficulty;
  final String duration;
  final String instructor;
  final String? instructorAvatar;
  final String description;
  final List<String> learningOutcomes;
  final String image;
  final int lessonsCount;
  final int enrolledCount;
  final double rating;
  final bool featured;

  Program({
    required this.id,
    required this.title,
    required this.category,
    required this.difficulty,
    required this.duration,
    required this.instructor,
    this.instructorAvatar,
    required this.description,
    required this.learningOutcomes,
    required this.image,
    required this.lessonsCount,
    required this.enrolledCount,
    required this.rating,
    required this.featured,
  });

  factory Program.fromJson(Map<String,dynamic> json) {
    final lo = (json['learningOutcomes'] as List<dynamic>?)?.map((e)=>e as String).toList() ?? [];
    return Program(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      difficulty: json['difficulty'],
      duration: json['duration'],
      instructor: json['instructor'],
      instructorAvatar: json['instructorAvatar'],
      description: json['description'],
      learningOutcomes: lo,
      image: json['image'],
      lessonsCount: json['lessonsCount'] ?? 0,
      enrolledCount: json['enrolledCount'] ?? 0,
      rating: (json['rating']?.toDouble() ?? 0.0),
      featured: json['featured'] ?? false,
    );
  }
}
