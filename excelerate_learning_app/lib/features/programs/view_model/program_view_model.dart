import 'package:excelerate_learning_app/features/home/model/program_model.dart';
import 'package:excelerate_learning_app/features/programs/model/lesson_model.dart';
import 'package:excelerate_learning_app/features/programs/services/program_service.dart';
import 'package:get/get.dart';


class ProgramViewModel extends GetxController {
  final ProgramService _service = ProgramService();
  final programs = <Program>[].obs;
  final lessons = <Lesson>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadAll();
  }

  Future<void> loadAll() async {
    isLoading.value = true;
    final ps = await _service.loadPrograms();
    final ls = await _service.loadLessons();
    programs.assignAll(ps);
    lessons.assignAll(ls);
    isLoading.value = false;
  }

  Program? findProgram(String id) =>
      programs.firstWhereOrNull((p) => p.id == id);

  List<Lesson> lessonsForProgram(String programId) =>
      lessons.where((l) => l.programId == programId).toList();
}
