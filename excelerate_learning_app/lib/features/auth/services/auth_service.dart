import 'package:excelerate_learning_app/app/utils/json_loader.dart';
import 'package:excelerate_learning_app/features/auth/model/user_model.dart';

class AuthService {
  Future<List<UserModel>> loadUsers() async {
    final list = await JsonLoader.loadList('assets/data/users.json');
    return list.map((e) => UserModel.fromJson(e as Map<String,dynamic>)).toList();
  }

  Future<UserModel?> login(String email) async {
    final users = await loadUsers();
    try {
      return users.firstWhere((u) => u.email == email);
    } catch (e) {
      return null;
    }
  }

  Future<UserModel> signup(String name, String email) async {
    // For mock: create a local user object. In production you'd call API.
    final user = UserModel(
      id: 'user-${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
      role: 'learner',
      avatar: null,
    );
    // We do not persist to file here (mock). Return user.
    return user;
  }
}
