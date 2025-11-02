import 'package:excelerate_learning_app/app/utils/json_loader.dart';
import 'package:excelerate_learning_app/features/enrollment/model/enrollment_model.dart';

class EnrollmentService {
  Future<List<EnrollmentModel>> loadEnrollments() async {
    final raw = await JsonLoader.loadList('assets/data/enrollments.json');
    return raw.map((e) => EnrollmentModel.fromJson(e as Map<String,dynamic>)).toList();
  }
}
