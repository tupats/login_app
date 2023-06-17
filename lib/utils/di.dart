import 'package:get_it/get_it.dart';
import '../features/auth/repository/auth_repository.dart';
import '../router/router.dart';

final getIt = GetIt.instance;

void injectDependancies() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
}
