import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:login_app/router/wrapper.dart';

import '../features/auth/screens/login/login_screen.dart';
import '../features/auth/screens/signup/signup_screen.dart';
import '../features/common/models/user_model.dart';
import '../features/home/home_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AppRoute.page,
          initial: true,
          children: [
            AutoRoute(page: LoginRoute.page, initial: true),
            AutoRoute(page: SignupRoute.page),
            AutoRoute(page: HomeRoute.page),
          ],
        ),
      ];
}
