import 'package:excelerate_learning_app/features/auth/model/user_model.dart';
import 'package:excelerate_learning_app/features/auth/view_model/auth_view_model.dart';
import 'package:excelerate_learning_app/features/enrollment/model/enrollment_model.dart';
import 'package:excelerate_learning_app/features/enrollment/view_model/enrollment_view_model.dart';
import 'package:get/get.dart';



class ProfileViewModel extends GetxController {
  late final AuthViewModel _auth;
  late final EnrollmentViewModel _enroll;

  final Rx<UserModel?> user = Rx<UserModel?>(null);
  final enrollments = <EnrollmentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _auth = Get.find<AuthViewModel>();
    _enroll = Get.find<EnrollmentViewModel>();

    /// Load user immediately
    user.value = _auth.user.value;

    /// Sync enrollments whenever EnrollmentViewModel updates
    ever(_enroll.enrollments, (_) => _loadUserEnrollments());

    _loadUserEnrollments();
  }

  void _loadUserEnrollments() {
    final userId = _auth.user.value?.id;
    if (userId == null) {
      enrollments.clear();
      return;
    }

    enrollments.assignAll(
      _enroll.enrollments.where((e) => e.userId == userId),
    );
  }

  //Stats
  int get completedCount =>
      enrollments.where((e) => e.status == "completed").length;

  int get inProgressCount =>
      enrollments.where((e) => e.status == "in-progress").length;

  double get averageProgress {
    if (enrollments.isEmpty) return 0;
    return enrollments.fold(0.0,(sum, e) => sum + e.progress) /
        enrollments.length;
  }

  Future<void> logout() async {
    await _auth.logout();
  }
}
