import 'package:excelerate_learning_app/features/enrollment/model/enrollment_model.dart';
import 'package:excelerate_learning_app/features/enrollment/services/enrollment_services.dart';
import 'package:get/get.dart';

class EnrollmentViewModel extends GetxController {
  final EnrollmentService _service = EnrollmentService();
  final enrollments = <Enrollment>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    final data = await _service.loadEnrollments();
    enrollments.assignAll(data);
    isLoading.value = false;
  }

  Enrollment? findForProgram(String programId) => enrollments.firstWhereOrNull((e) => e.programId == programId);

  Future<void> enroll(String programId) async {
    // create a mock enrollment for current user (userId is mocked)
    final newE = Enrollment(
      id: 'enr-${DateTime.now().millisecondsSinceEpoch}',
      userId: 'user-1',
      programId: programId,
      enrolledDate: DateTime.now().toIso8601String(),
      progress: 0.0,
      completedLessons: [],
      status: 'in-progress',
    );
    enrollments.add(newE);
  }

  Future<void> toggleLesson(String programId, String lessonId, int totalLessons) async {
    final e = findForProgram(programId);
    if (e == null) return;
    if (e.completedLessons.contains(lessonId)) {
      e.completedLessons.remove(lessonId);
    } else {
      e.completedLessons.add(lessonId);
    }
    // update progress
    e.progress = (e.completedLessons.length / totalLessons) * 100;
    if (e.completedLessons.length == totalLessons) {
      e.status = 'completed';
    } else {
      e.status = 'in-progress';
    }
    enrollments.refresh();
  }
}
