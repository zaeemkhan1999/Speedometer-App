import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_driver/flutter_driver.dart' as driver;

void main() {
  group('LoginScreen', () {
    driver.FlutterDriver? flutterDriver;

    setUpAll(() async {
      flutterDriver = await driver.FlutterDriver.connect(
          dartVmServiceUrl: 'http://127.0.0.1:61394/36I8nVO1KsE=/');
    });

    tearDownAll(() async {
      if (flutterDriver != null) {
        await flutterDriver!.close();
      }
    });

    test('enterCredentialsAndLogin', () async {
      final email = 'test@example.com';
      final password = 'password';

      await flutterDriver!.tap(driver.find.byValueKey('emailTextField'));
      await flutterDriver!.enterText(email);
      await flutterDriver!.tap(driver.find.byValueKey('passwordTextField'));
      await flutterDriver!.enterText(password);
      await flutterDriver!.tap(driver.find.byValueKey('loginButton'));

      await flutterDriver!.waitFor(driver.find.byType('DashboardPage'));
    });
  });

  group('SignupScreen', () {
    driver.FlutterDriver? flutterDriver;

    setUpAll(() async {
      flutterDriver = await driver.FlutterDriver.connect(
          dartVmServiceUrl: 'http://127.0.0.1:61394/36I8nVO1KsE=/');
    });

    tearDownAll(() async {
      if (flutterDriver != null) {
        await flutterDriver!.close();
      }
    });

    test('enterRegistrationDetailsAndSignup', () async {
      final name = 'John Doe';
      final email = 'john.doe@example.com';
      final password = 'password';
      final age = '25';
      final licenseNumber = 'ABC123';

      await flutterDriver!.tap(driver.find.byValueKey('nameTextField'));
      await flutterDriver!.enterText(name);
      await flutterDriver!.tap(driver.find.byValueKey('emailTextField'));
      await flutterDriver!.enterText(email);
      await flutterDriver!.tap(driver.find.byValueKey('passwordTextField'));
      await flutterDriver!.enterText(password);
      await flutterDriver!.tap(driver.find.byValueKey('ageTextField'));
      await flutterDriver!.enterText(age);
      await flutterDriver!
          .tap(driver.find.byValueKey('licenseNumberTextField'));
      await flutterDriver!.enterText(licenseNumber);
      await flutterDriver!.tap(driver.find.byValueKey('getStartedButton'));

      // Wait for the user registration to complete
      await flutterDriver!
          .waitFor(driver.find.text('Registered Successfully. Please Login..'));
      await flutterDriver!.waitFor(driver.find.byType('LoginScreen'));
    });
  });

  group('DashboardPage', () {
    driver.FlutterDriver? flutterDriver;

    setUpAll(() async {
      flutterDriver = await driver.FlutterDriver.connect(
          dartVmServiceUrl: 'http://localhost:5556/ws');
    });

    tearDownAll(() async {
      if (flutterDriver != null) {
        await flutterDriver!.close();
      }
    });

    test('checkCoordinates', () async {
      // Wait for the DashboardPage to appear
      await flutterDriver!.waitFor(driver.find.byType('DashboardPage'));

      // Get the initial coordinates
      final initialCoordinates = await flutterDriver!
          .getCenter(driver.find.byValueKey('mapContainer'));
      final initialLatitude = initialCoordinates.dx;
      final initialLongitude = initialCoordinates.dy;

      // Perform some actions that trigger coordinate changes, such as tapping the location button
      await flutterDriver!.tap(driver.find.byValueKey('locationButton'));

      // Get the updated coordinates
      final updatedCoordinates = await flutterDriver!
          .getCenter(driver.find.byValueKey('mapContainer'));
      final updatedLatitude = updatedCoordinates.dx;
      final updatedLongitude = updatedCoordinates.dy;

      // Verify that the coordinates have changed
      expect(updatedLatitude, isNot(equals(initialLatitude)));
      expect(updatedLongitude, isNot(equals(initialLongitude)));
    });
  });
}
