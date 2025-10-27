import 'package:excelerate_learning_app/features/auth/view/login_view.dart';
import 'package:excelerate_learning_app/features/auth/view/signup_view.dart';
import 'package:excelerate_learning_app/features/enrollment/view/enrollment_view.dart';
import 'package:excelerate_learning_app/features/home/view/home_view.dart';
import 'package:excelerate_learning_app/features/programs/view/program_details_view.dart';
import 'package:excelerate_learning_app/features/programs/view/program_list_view.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
    GetPage(name: Routes.SIGNUP, page: () => SignupScreen()),
    GetPage(name: Routes.HOME, page: () => HomeScreen()),
    GetPage(name: Routes.PROGRAMS, page: () => ProgramListScreen()),
    GetPage(
      name: Routes.PROGRAM_DETAILS,
      page: () {
        final id = Get.parameters['id']!;
        return ProgramDetailsScreen(programId: id);
      },
    ),
    GetPage(
      name: Routes.ENROLLMENT,
      page: () {
        final id = Get.parameters['id']!;
        return EnrollmentView(programId: id);
      },
    ),
    // GetPage(
    //   name: Routes.FEEDBACK,
    //   page: () {
    //     final id = Get.parameters['id']!;
    //     return FeedbackScreen(programId: id);
    //   },
    // ),
    // GetPage(name: Routes.PROFILE, page: () => ProfileScreen()),
    // GetPage(name: Routes.ADMIN, page: () => AdminDashboardScreen()),
  ];
}
