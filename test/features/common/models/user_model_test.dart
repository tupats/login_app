import 'package:flutter_test/flutter_test.dart';
import 'package:login_app/features/common/models/user_model.dart';

void main() {
  group('Testing User model', () {
    test('User model generated', () {
      final user = User.generate();
      expect(user.email, 'user@gmail.com');
      expect(user.username, 'Username');
    });

    test('User model generated with email', () {
      const email = 'test@test.com';
      final user = User.generate(email: email);
      expect(user.email, email);
    });

    test('User model generated with username', () {
      const username = 'test';
      final user = User.generate(username: username);
      expect(user.username, username);
    });
  });
}
