import 'package:flutter/material.dart';

final _burgerIcon = Transform.flip(
  flipX: true,
  child: const Icon(
    Icons.short_text,
  ),
);

class CommonAppBar extends AppBar {
  CommonAppBar({
    super.key,
    required String title,
    VoidCallback? onBackPressed,
    bool automaticallyImplyLeading = true,
  }) : super(
          title: Text(title),
          leading: onBackPressed != null
              ? BackButton(onPressed: onBackPressed)
              : null,
          automaticallyImplyLeading: automaticallyImplyLeading,
          actions: [
            IconButton(
              onPressed: () {},
              icon: _burgerIcon,
            ),
          ],
        );
}
