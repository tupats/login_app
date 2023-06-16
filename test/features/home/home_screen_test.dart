import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_app/features/common/models/user_model.dart';
import 'package:login_app/features/home/home_screen.dart';

import '../../utils.dart';

Widget createHomeScreen(User user) => createScreen(HomeScreen(user: user));

void main() {
  group('Testing HomeScreen', () {
    final user = User.generate();
    testWidgets('scrolling', (tester) async {
      await tester.pumpWidget(createHomeScreen(user));
      expect(find.text(user.username), findsOneWidget);
      await tester.fling(
        find.text(user.email),
        const Offset(0, -200),
        3000,
        warnIfMissed: false,
      );
      await tester.pumpAndSettle();
      expect(find.text(user.email), findsOneWidget);
    });
  });
}
