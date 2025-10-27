import 'package:excelerate_learning_app/features/auth/view%20model/auth_view_model.dart';
import 'package:excelerate_learning_app/features/enrollment/view%20model/enrollment_view_model.dart';
import 'package:excelerate_learning_app/features/home/view_model/home_view_model.dart';
import 'package:excelerate_learning_app/features/programs/view%20model/program_view_model.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthViewModel());
    Get.put(HomeViewModel());
    Get.put(ProgramViewModel());
    Get.put(EnrollmentViewModel());
    // Get.put(ProfileController());
    // Get.put(FeedbackController());
  }
}
