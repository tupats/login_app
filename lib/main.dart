import 'package:flutter/material.dart';
import 'package:login_app/utils/di.dart';
import 'package:login_app/router/router.dart';
import 'package:login_app/themes/themes.dart';
import 'package:login_app/utils/forms.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  injectDependancies();
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  final _router = getIt<AppRouter>();

  LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: MaterialApp.router(
        theme: theme,
        debugShowCheckedModeBanner: false,
        routerConfig: _router.config(),
      ),
    );
  }
}