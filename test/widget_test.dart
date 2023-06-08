import 'package:com.zaeem.authapp.authapp/pages/dashboard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:com.zaeem.authapp.authapp/pages/auth/login.dart';
import 'package:com.zaeem.authapp.authapp/pages/auth/signup.dart';
import 'package:com.zaeem.authapp.authapp/widgets/textfields.dart'
    as CustomTextField;
import 'package:com.zaeem.authapp.authapp/widgets/buttons.dart' as CustomButton;

void main() {
  group('LoginScreen', () {
    testWidgets('renders custom text fields correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      expect(find.byType(CustomTextField.TextFields), findsNWidgets(2));
    });

    testWidgets('triggers login process on button tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      final emailTextFieldFinder =
          find.byType(CustomTextField.TextFields).first;
      final passwordTextFieldFinder =
          find.byType(CustomTextField.TextFields).last;
      final loginButtonFinder = find.byType(CustomButton.Buttons);

      await tester.enterText(emailTextFieldFinder, 'test@example.com');
      await tester.enterText(passwordTextFieldFinder, 'password');
      await tester.tap(loginButtonFinder);
      await tester.pump();

      expect(find.text('Let\'s Go...'), findsOneWidget);
    });

    testWidgets('navigates to signup screen on tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      final signupTextFinder = find.text("Don't have an account? Signup");

      await tester.tap(signupTextFinder);
      await tester.pumpAndSettle();

      expect(find.text('Signup'), findsOneWidget);
    });
  });

  group('SignupScreen', () {
    testWidgets('renders text fields correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignupScreen()));

      final nameTextFieldFinder = find.byKey(const Key('nameTextField'));
      final emailTextFieldFinder = find.byKey(const Key('emailTextField'));
      final passwordTextFieldFinder =
          find.byKey(const Key('passwordTextField'));
      final ageTextFieldFinder = find.byKey(const Key('ageTextField'));
      final licenseNumberTextFieldFinder =
          find.byKey(const Key('licenseNumberTextField'));

      expect(nameTextFieldFinder, findsOneWidget);
      expect(emailTextFieldFinder, findsOneWidget);
      expect(passwordTextFieldFinder, findsOneWidget);
      expect(ageTextFieldFinder, findsOneWidget);
      expect(licenseNumberTextFieldFinder, findsOneWidget);
    });

    testWidgets('triggers signup process on button tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignupScreen()));

      final nameTextFieldFinder = find.byKey(const Key('nameTextField'));
      final emailTextFieldFinder = find.byKey(const Key('emailTextField'));
      final passwordTextFieldFinder =
          find.byKey(const Key('passwordTextField'));
      final ageTextFieldFinder = find.byKey(const Key('ageTextField'));
      final licenseNumberTextFieldFinder =
          find.byKey(const Key('licenseNumberTextField'));
      final getStartedButtonFinder = find.byKey(const Key('getStartedButton'));

      await tester.enterText(nameTextFieldFinder, 'John Doe');
      await tester.enterText(emailTextFieldFinder, 'john.doe@example.com');
      await tester.enterText(passwordTextFieldFinder, 'password');
      await tester.enterText(ageTextFieldFinder, '25');
      await tester.enterText(licenseNumberTextFieldFinder, 'ABC123');
      await tester.tap(getStartedButtonFinder);
      await tester.pump();

      // Verify the expected behavior after the get started button is tapped
      // For example, you can check if the user is redirected to the Login screen
      expect(find.byType(LoginScreen), findsOneWidget);
    });
  });

  group('DashboardPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: DashboardPage()));

      final titleFinder = find.text('Dashboard');
      // final locationButtonFinder = find.byKey(const Key('locationButton'));

      expect(titleFinder, findsOneWidget);
      // expect(locationButtonFinder, findsOneWidget);
    });

    testWidgets('changes coordinates on button tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: DashboardPage()));

      final initialLatitude = 37.7749;
      final initialLongitude = -122.4194;

      final locationButtonFinder = find.byKey(const Key('locationButton'));
      final latitudeTextFinder = find.byKey(const Key('latitudeText'));
      final longitudeTextFinder = find.byKey(const Key('longitudeText'));

      final latitudeBeforeTap = double.parse(
          (tester.widget<Text>(latitudeTextFinder).data!).replaceAll(',', ''));
      final longitudeBeforeTap = double.parse(
          (tester.widget<Text>(longitudeTextFinder).data!).replaceAll(',', ''));

      expect(latitudeBeforeTap, equals(initialLatitude));
      expect(longitudeBeforeTap, equals(initialLongitude));

      await tester.tap(locationButtonFinder);
      await tester.pump();

      final latitudeAfterTap = double.parse(
          (tester.widget<Text>(latitudeTextFinder).data!).replaceAll(',', ''));
      final longitudeAfterTap = double.parse(
          (tester.widget<Text>(longitudeTextFinder).data!).replaceAll(',', ''));

      expect(latitudeAfterTap, isNot(equals(initialLatitude)));
      expect(longitudeAfterTap, isNot(equals(initialLongitude)));
    });
  });
}
