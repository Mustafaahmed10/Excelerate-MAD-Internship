import 'package:excelerate_learning_app/app/utils/json_loader.dart';
import 'package:excelerate_learning_app/features/home/model/program_model.dart';
import 'package:excelerate_learning_app/features/programs/model/lesson_model.dart';


class ProgramService {
  Future<List<Lesson>> loadLessons() async {
    final raw = await JsonLoader.loadList('assets/data/lessons.json');
    return raw.map((e) => Lesson.fromJson(e as Map<String,dynamic>)).toList();
  }

  Future<List<Program>> loadPrograms() async {
    final raw = await JsonLoader.loadList('assets/data/programs.json');
    return raw.map((e) => Program.fromJson(e as Map<String,dynamic>)).toList();
  }
}
