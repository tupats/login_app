import 'dart:math';

class User {
  final String username;
  final String email;
  final String phoneNumber;
  final int completedProjects;
  final String id;

  const User({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.completedProjects,
    required this.id,
  });

  factory User.generate({String? email, String? username}) {
    Random random = Random();

    return User(
      username: username ?? email?.split('@').first ?? 'Username',
      email: email ?? 'user@gmail.com',
      phoneNumber: '+37${(random.nextDouble() * 1000000000).toInt()}',
      completedProjects: random.nextInt(512),
      id: random.nextInt(999999).toString().padLeft(6, '0'),
    );
  }
}
