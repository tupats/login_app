import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:login_app/features/common/models/user_model.dart';
import 'package:login_app/main.dart';
import 'package:login_app/router/router.dart';
import 'package:login_app/utils/di.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final user = User.generate();
  final router = AppRouter();

  group('end-to-end test', () {
    testWidgets('testing login', (tester) async {
      injectDependancies();
      await tester.pumpWidget(LoginApp(router: router));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, user.username);
      await tester.enterText(find.byType(TextField).last, 'password');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle();

      expect(find.text(user.username), findsOneWidget);
      expect(find.text(user.email), findsOneWidget);

      await tester.tap(find.text('Log Out').first);
      await tester.pumpAndSettle();

      await tester.drag(find.byType(Dismissible), const Offset(0, 500));
      await tester.pumpAndSettle();
    });
  });
}
