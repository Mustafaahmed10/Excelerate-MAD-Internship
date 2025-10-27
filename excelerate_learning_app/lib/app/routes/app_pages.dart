


import 'package:excelerate_learning_app/app/routes/app_routes.dart';
import 'package:excelerate_learning_app/features/auth/view/login_view.dart';
import 'package:excelerate_learning_app/features/auth/view/signup_view.dart';
import 'package:excelerate_learning_app/features/enrollment/view%20model/enrollment_view_model.dart';
import 'package:excelerate_learning_app/features/home/view/home_view.dart';
import 'package:excelerate_learning_app/features/programs/view/program_list_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => const HomeScreen()),

    GetPage(name: Routes.LOGIN, page: () => const LoginScreen()),
    GetPage(name: Routes.SIGNUP, page: () => const SignupScreen()),
    GetPage(name: Routes.PROGRAMS, page: () => const ProgramListScreen()),
    GetPage(name: Routes.PROGRAM_DETAILS, page: () {
      final id = Get.parameters['id']!;
      return ProgramDetailsScreen(programId: id);
    }),
    GetPage(name: Routes.ENROLLMENT, page: () {
      final id = Get.parameters['id']!;
      return EnrollmentViewModel(programId: id);
    }),
    // GetPage(name: Routes.FEEDBACK, page: () {
    //   final id = Get.parameters['id']!;
    //   return FeedbackScreen(programId: Get.parameters['id']!);
    // }),
    // GetPage(name: Routes.PROFILE, page: () => const ProfileScreen()),
    // GetPage(name: Routes.ADMIN, page: () => const AdminDashboardScreen()),
  ];
}
