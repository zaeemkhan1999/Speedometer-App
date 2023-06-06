import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginScreen', () {
    driver.FlutterDriver? flutterDriver;

    setUpAll(() async {
      flutterDriver = await driver.FlutterDriver.connect(
          dartVmServiceUrl: 'http://127.0.0.1:5556/ws/');
    });

    tearDownAll(() async {
      if (flutterDriver != null) {
        await flutterDriver!.close();
      }
    });

    test('takeScreenshot', () async {
      await flutterDriver!.waitFor(
          driver.find.text('Login')); // Wait for the Login screen to appear

      final screenshot = await flutterDriver!.screenshot();
      // Compare the screenshot with a reference image using a comparison algorithm or library

      // Assert the result based on the comparison
      expect(screenshot, isNotNull);
    });
  });

  group('SignupScreen', () {
    driver.FlutterDriver? flutterDriver;

    setUpAll(() async {
      flutterDriver = await driver.FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (flutterDriver != null) {
        await flutterDriver!.close();
      }
    });

    test('takeScreenshot', () async {
      await flutterDriver!.waitFor(driver.find
          .text('Registration')); // Wait for the Signup screen to appear

      final screenshot = await flutterDriver!.screenshot();
      // Compare the screenshot with a reference image using a comparison algorithm or library

      // Assert the result based on the comparison
      expect(screenshot, isNotNull);
    });
  });

  group('DashboardPage', () {
    driver.FlutterDriver? flutterDriver;

    setUpAll(() async {
      flutterDriver = await driver.FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (flutterDriver != null) {
        await flutterDriver!.close();
      }
    });

    test('takeScreenshot', () async {
      await flutterDriver!.waitFor(driver.find.text('Welcome,'));

      final screenshot = await flutterDriver!.screenshot();
      // Save the screenshot to a file or compare it with a reference image

      expect(screenshot, isNotNull);
    });
  });
}
