import 'package:excelerate_learning_app/features/auth/view%20model/auth_view_model.dart';
import 'package:excelerate_learning_app/features/home/view_model/home_view_model.dart';
import 'package:get/get.dart';



class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthViewModel());
    Get.put(HomeViewModel());
  }
}
