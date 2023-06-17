import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/gen/assets.gen.dart';
import '../../../common/widgets/submit_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../router/router.dart';
import '../../../common/widgets/app_bar.dart';
import '../../widgets/auth_suggestion.dart';
import '../../widgets/social_login_list.dart';
import '../../cubit/auth_cubit.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final form = FormGroup({
    'email': FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
    ]),
    'repeatPassword': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
    ]),
  }, validators: [
    Validators.mustMatch('password', 'repeatPassword'),
  ]);

  Future<void> signup(BuildContext context) async {
    await context.read<AuthCubit>().signup(
          email: form.control('email').value,
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
        title: 'Sign Up',
        onBackPressed: () => context.navigateTo(const LoginRoute()),
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
                const SizedBox(height: 45),
                Assets.images.signup.image(height: 141),
                const SizedBox(height: 45),
                ReactiveTextField(
                  formControlName: 'email',
                  decoration: const InputDecoration(
                    labelText: 'Enter email',
                  ),
                  autofillHints: const [AutofillHints.email],
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                ReactiveTextField(
                  formControlName: 'password',
                  decoration: const InputDecoration(
                    labelText: 'Enter password',
                  ),
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                ReactiveTextField(
                  formControlName: 'repeatPassword',
                  decoration: const InputDecoration(
                    labelText: 'Confirm password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                SubmitButton(
                  title: 'Sign Up',
                  onPressed: () => signup(context),
                ),
                const SizedBox(height: 16),
                const Text('or'),
                const SizedBox(height: 16),
                const SocialLoginList(),
                const SizedBox(height: 51),
                AuthSuggestion(
                  title: 'Already have an account?',
                  buttonTitle: 'Sign In',
                  onButtonPressed: () => context.navigateTo(const LoginRoute()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
