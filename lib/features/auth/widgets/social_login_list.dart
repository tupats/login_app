import 'package:flutter/material.dart';
import 'package:login_app/gen/assets.gen.dart';

class SocialLoginList extends StatelessWidget {
  const SocialLoginList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            child: Assets.icons.facebook.image(height: 16),
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            child: Assets.icons.twitter.image(height: 16),
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            child: Assets.icons.linkedin.image(height: 16),
          ),
        ),
      ],
    );
  }
}
