import 'package:bloc/bloc.dart';
import '../repository/auth_repository.dart';
import '../../common/models/user_model.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthLoading());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      final user = await _authRepository.login(
        username: username,
        password: password,
      );
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signup({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      final user = await _authRepository.signup(
        email: email,
        password: password,
      );
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void logout() {
    emit(AuthUnauthenticated());
  }
}
