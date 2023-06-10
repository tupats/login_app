import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_app/utils/text_styles.dart';

class AuthSuggestion extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback? onButtonPressed;

  const AuthSuggestion({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
          ),
          const TextSpan(
            text: ' ',
          ),
          TextSpan(
            text: buttonTitle,
            recognizer: TapGestureRecognizer()..onTap = onButtonPressed,
            style: AppTextStyles.underline(context),
          ),
        ],
      ),
    );
  }
}
