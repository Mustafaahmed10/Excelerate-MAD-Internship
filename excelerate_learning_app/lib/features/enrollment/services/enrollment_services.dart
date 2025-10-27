import 'package:excelerate_learning_app/app/utils/json_loader.dart';
import 'package:excelerate_learning_app/features/enrollment/model/enrollment_model.dart';

class EnrollmentService {
  Future<List<Enrollment>> loadEnrollments() async {
    final raw = await JsonLoader.loadList('assets/data/enrollments.json');
    return raw.map((e) => Enrollment.fromJson(e as Map<String,dynamic>)).toList();
  }
}
