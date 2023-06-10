import 'package:get_it/get_it.dart';
import 'package:login_app/features/auth/repository/auth_repository.dart';
import 'package:login_app/router/router.dart';

final getIt = GetIt.instance;

void injectDependancies() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
}
