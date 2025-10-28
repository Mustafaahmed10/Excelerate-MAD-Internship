import 'package:excelerate_learning_app/features/auth/model/user_model.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';

class AuthViewModel extends GetxController {
  final AuthService _service = AuthService();

  final user = Rxn<UserModel>();
  final isLoading = false.obs;

  Future<bool> login(String email) async {
    isLoading.value = true;
    final u = await _service.login(email);
    isLoading.value = false;
    if (u != null) {
      user.value = u;
      return true;
    }
    return false;
  }

  Future<UserModel> signup(String name, String email) async {
    isLoading.value = true;
    final u = await _service.signup(name, email);
    isLoading.value = false;
    user.value = u;
    return u;
  }

  void logout() {
    user.value = null;
  }

  bool get isAuthenticated => user.value != null;
}
