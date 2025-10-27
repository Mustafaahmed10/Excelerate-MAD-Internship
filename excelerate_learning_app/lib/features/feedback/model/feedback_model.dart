class FeedbackModel {
  String id;
  String userId;
  String programId;
  int rating;
  String comment;
  String date;

  FeedbackModel({
    required this.id,
    required this.userId,
    required this.programId,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        id: json['id'],
        userId: json['userId'],
        programId: json['programId'],
        rating: json['rating'],
        comment: json['comment'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'programId': programId,
        'rating': rating,
        'comment': comment,
        'date': date,
      };
}
