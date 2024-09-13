import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integrated_testing/home_screen.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integrated_testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End to end test', () {
    testWidgets('Verify login screen with correct username and password',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(Key("username_controller")), 'username');
      await tester.enterText(
          find.byKey(Key("password_controller")), 'password');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('Verify login screen with incorrect username and password',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("username_controller")), 'akshay');
      await tester.enterText(find.byKey(Key("password_controller")), 'mohan');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text("Invalid username or password"), findsOneWidget);
    });
  });
}
