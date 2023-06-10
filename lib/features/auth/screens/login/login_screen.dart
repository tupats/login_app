import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/features/auth/widgets/social_login_list.dart';
import 'package:login_app/gen/assets.gen.dart';
import 'package:login_app/router/router.dart';
import 'package:login_app/features/common/widgets/app_bar.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../common/widgets/submit_button.dart';
import '../../widgets/auth_suggestion.dart';
import '../../cubit/auth_cubit.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final form = FormGroup({
    'username': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(3),
    ]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
    ]),
  });

  Future<void> login(BuildContext context) async {
    await context.read<AuthCubit>().login(
          username: form.control('username').value,
          password: form.control('password').value,
        );
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Sign In',
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
            bottom: 30,
          ),
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 50),
                Assets.images.login.image(height: 145),
                const SizedBox(height: 50),
                ReactiveTextField(
                  formControlName: 'username',
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 16),
                ReactiveTextField(
                  formControlName: 'password',
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 14),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot your password?'),
                  ),
                ),
                const SizedBox(height: 50),
                SubmitButton(
                  title: 'Login',
                  onPressed: () => login(context),
                ),
                const SizedBox(height: 16),
                const Text('or'),
                const SizedBox(height: 16),
                const SocialLoginList(),
                const SizedBox(height: 51),
                AuthSuggestion(
                  title: 'Don\'t have an account?',
                  buttonTitle: 'Sign up',
                  onButtonPressed: () {
                    context.pushRoute(const SignupRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
