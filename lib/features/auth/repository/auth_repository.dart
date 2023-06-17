import '../../common/models/user_model.dart';

class AuthRepository {
  Future<User> login({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return User.generate(username: username);
  }

  Future<User> signup({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return User.generate(email: email);
  }
}
