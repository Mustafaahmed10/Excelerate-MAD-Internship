import 'package:excelerate_learning_app/app/routes/app_routes.dart';
import 'package:excelerate_learning_app/features/auth/model/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../services/auth_service.dart';

class AuthViewModel extends GetxController {
  final AuthService _service = AuthService();
  final box = GetStorage();

  final user = Rx<UserModel?>(null);
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _tryAutoLogin();
  }

  // ✅ AUTO LOGIN (stored email + password)
  void _tryAutoLogin() async {
    final email = box.read("logged_in_email");
    final password = box.read("logged_in_password");

    if (email != null && password != null) {
      final u = await _service.login(email, password);
      if (u != null) {
        user.value = u;
        Get.offAllNamed(Routes.HOME);
      }
    }
  }

  // ✅ LOGIN with email + password
  Future<bool> login(String email, String password) async {
    isLoading.value = true;

    final u = await _service.login(email, password);
    isLoading.value = false;

    if (u != null) {
      user.value = u;

      // ✅ Save session
      box.write("logged_in_email", email);
      box.write("logged_in_password", password);

      return true;
    }
    return false;
  }

  // ✅ LOGOUT
  Future<void> logout() async {
    box.remove("logged_in_email");
    box.remove("logged_in_password");

    user.value = null;
    Get.offAllNamed(Routes.LOGIN);
  }

  // ✅ SIGNUP with password
  Future<UserModel> signup(String name, String email, String password) async {
    final newUser = await _service.signup(name, email, password);

    // Optional: save signup user as logged in
    user.value = newUser;

    box.write("logged_in_email", email);
    box.write("logged_in_password", password);

    return newUser;
  }
}
