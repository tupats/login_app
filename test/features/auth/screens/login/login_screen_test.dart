import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_app/features/auth/cubit/auth_cubit.dart';
import 'package:login_app/features/auth/repository/auth_repository.dart';
import 'package:login_app/features/auth/screens/login/login_screen.dart';

import '../../../../utils.dart';

Widget createLoginScreen() => createScreen(BlocProvider(
      create: (context) => AuthCubit(AuthRepository()),
      child: const LoginScreen(),
    ));

void main() {
  group('Testing LoginScreen', () {
    testWidgets('outline buttons', (tester) async {
      await tester.pumpWidget(createLoginScreen());
      expect(find.byType(OutlinedButton), findsNWidgets(3));
    });

    testWidgets('validation', (tester) async {
      await tester.pumpWidget(createLoginScreen());
      await tester.fling(
        find.byType(ElevatedButton).first,
        const Offset(0, -200),
        3000,
        warnIfMissed: false,
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'hi');
      await tester.enterText(find.byType(TextField).last, 'hi');
      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle();

      expect(find.text('Entry is too short'), findsWidgets);

      await tester.enterText(find.byType(TextField).first, 'username');
      await tester.pumpAndSettle();

      expect(find.text('Entry is too short'), findsOneWidget);

      await tester.enterText(find.byType(TextField).last, 'password');
      await tester.pumpAndSettle();

      expect(find.text('Entry is too short'), findsNothing);
      expect(
        tester
            .widget<ElevatedButton>(find.byType(ElevatedButton).first)
            .enabled,
        true,
      );
    });
  });
}
