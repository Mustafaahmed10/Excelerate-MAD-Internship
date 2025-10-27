class Enrollment {
  final String id;
  final String userId;
  final String programId;
  final String enrolledDate;
  double progress;
  List<String> completedLessons;
  String status;

  Enrollment({
    required this.id,
    required this.userId,
    required this.programId,
    required this.enrolledDate,
    required this.progress,
    required this.completedLessons,
    required this.status,
  });

  factory Enrollment.fromJson(Map<String,dynamic> json) {
    return Enrollment(
      id: json['id'],
      userId: json['userId'],
      programId: json['programId'],
      enrolledDate: json['enrolledDate'],
      progress: (json['progress']?.toDouble() ?? 0.0),
      completedLessons: List<String>.from(json['completedLessons'] ?? []),
      status: json['status'] ?? 'in-progress',
    );
  }

  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'programId': programId,
      'enrolledDate': enrolledDate,
      'progress': progress,
      'completedLessons': completedLessons,
      'status': status,
    };
  }
}
