import 'package:excelerate_learning_app/features/home/model/program_model.dart';
import 'package:get/get.dart';
import '../services/program_service.dart';

class HomeViewModel extends GetxController {
  final ProgramService _service = ProgramService();
  final programs = <Program>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    final data = await _service.loadPrograms();
    programs.assignAll(data);
    isLoading.value = false;
  }

  List<Program> get featured => programs.where((p) => p.featured).toList();
}
