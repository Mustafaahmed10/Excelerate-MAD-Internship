import 'package:excelerate_learning_app/features/auth/view_model/auth_view_model.dart';
import 'package:excelerate_learning_app/features/enrollment/model/enrollment_model.dart';
import 'package:excelerate_learning_app/features/enrollment/services/enrollment_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EnrollmentViewModel extends GetxController {
  final EnrollmentService _service = EnrollmentService();
  final enrollments = <EnrollmentModel>[].obs;
  final isLoading = false.obs;
  final box = GetStorage();
  late final AuthViewModel _auth;

  @override
  void onInit() {
    super.onInit();
    _auth = Get.find<AuthViewModel>();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;

    //Try loading saved enrollments
    final saved = box.read("enrollments");
    if (saved != null) {
      final list =
          (saved as List).map((e) => EnrollmentModel.fromJson(e)).toList();
      enrollments.assignAll(list);
      isLoading.value = false;
      return;
    }

    //If nothing saved, load from JSON mock
    final data = await _service.loadEnrollments();
    enrollments.assignAll(data);

    //Save initial mock into GetStorage
    box.write("enrollments", enrollments.map((e) => e.toJson()).toList());

    isLoading.value = false;
  }

  ///Get only enrollments for the logged-in user
  List<EnrollmentModel> get userEnrollments {
    final userId = _auth.user.value?.id;
    if (userId == null) return [];
    return enrollments.where((e) => e.userId == userId).toList();
  }

  ///Find enrollment for a specific program 
  EnrollmentModel? findForProgram(String programId) {
    final userId = _auth.user.value?.id;
    return userEnrollments.firstWhereOrNull(
      (e) => e.programId == programId && e.userId == userId,
    );
  }

  ///Enroll the REAL logged-in user
  Future<void> enroll(String programId) async {
    final userId = _auth.user.value?.id;
    if (userId == null) return;

    final newEnrollment = EnrollmentModel(
      id: 'enr-${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      programId: programId,
      enrolledDate: DateTime.now().toIso8601String(),
      progress: 0,
      completedLessons: [],
      status: "in-progress",
    );

    enrollments.add(newEnrollment);

    //Save
    box.write("enrollments", enrollments.map((e) => e.toJson()).toList());
  }

  ///Mark lessons as completed and update progress
  Future<void> toggleLesson(
    String programId,
    String lessonId,
    int totalLessons,
  ) async {
    final e = findForProgram(programId);
    if (e == null) return;

    if (e.completedLessons.contains(lessonId)) {
      e.completedLessons.remove(lessonId);
    } else {
      e.completedLessons.add(lessonId);
    }

    final count = e.completedLessons.length;
    e.progress = (count / totalLessons) * 100;
    e.status = count == totalLessons ? "completed" : "in-progress";

    enrollments.refresh();

    box.write("enrollments", enrollments.map((e) => e.toJson()).toList());
  }
}
