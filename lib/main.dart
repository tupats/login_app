import 'package:flutter/material.dart';
import 'utils/di.dart';
import 'router/router.dart';
import 'themes/themes.dart';
import 'utils/forms.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  injectDependancies();
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  final AppRouter _router;

  LoginApp({super.key, AppRouter? router})
      : _router = router ?? getIt<AppRouter>();

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