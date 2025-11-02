class EnrollmentModel {
  final String id;
  final String userId;
  final String programId;
  double progress;
  List<String> completedLessons; 
  String status;                
  String enrolledDate;

  EnrollmentModel({
    required this.id,
    required this.userId,
    required this.programId,
    required this.progress,
    required this.completedLessons,
    required this.status,
    required this.enrolledDate,
  });

  factory EnrollmentModel.fromJson(Map<String, dynamic> json) {
    return EnrollmentModel(
      id: json["id"],
      userId: json["userId"],
      programId: json["programId"],
      progress: (json["progress"] ?? 0).toDouble(),
      completedLessons: List<String>.from(json["completedLessons"] ?? []),
      status: json["status"] ?? "in-progress",
      enrolledDate: json["enrolledDate"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "programId": programId,
        "progress": progress,
        "completedLessons": completedLessons,
        "status": status,
        "enrolledDate": enrolledDate,
      };
}
