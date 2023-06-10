import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/utils/di.dart';
import 'package:login_app/features/auth/repository/auth_repository.dart';
import 'package:login_app/router/router.dart';

import '../features/auth/cubit/auth_cubit.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  AppScreen({super.key});

  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthRepository>()),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.router.replaceAll([HomeRoute(user: state.user)]);
            return;
          }
          if (state is AuthUnauthenticated) {
            context.router.replaceAll([const LoginRoute()]);
            return;
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: RepaintBoundary(
          key: _key,
          child: const AutoRouter(),
        ),
      ),
    );
  }
}