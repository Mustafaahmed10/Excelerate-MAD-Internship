import 'package:excelerate_learning_app/app/utils/json_loader.dart';
import 'package:excelerate_learning_app/features/auth/model/user_model.dart';

class AuthService {
  Future<List<UserModel>> loadUsers() async {
    final list = await JsonLoader.loadList('assets/data/users.json');
    return list.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<UserModel?> login(String email, String password) async {
    final users = await loadUsers();
    try {
      return users.firstWhere(
        (u) => u.email == email && u.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  Future<UserModel> signup(String name, String email, String password) async {
    final newUser = UserModel(
      id: 'user-${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
      password: password,    //save password
      role: 'learner',
      avatar: null,
    );

    // NOTE: Mock only → not saved to file unless we use GetStorage persistence
    return newUser;
  }
}
