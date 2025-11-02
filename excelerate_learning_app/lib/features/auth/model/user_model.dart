import 'package:excelerate_learning_app/features/enrollment/model/enrollment_model.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;   
  final String role;
  final String? avatar;
  final List<EnrollmentModel> enrollments;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,   
    required this.role,
    this.avatar,
    required this.enrollments,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],     
      role: json['role'],
      avatar: json['avatar'],
       enrollments: (json["enrollments"] as List<dynamic>? ?? [])
          .map((e) => EnrollmentModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,     
        'role': role,
        'avatar': avatar,
        "enrollments": enrollments.map((e) => e.toJson()).toList(),
      };
}
