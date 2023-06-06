import 'package:com.zaeem.authapp.authapp/resources/rider/rider_provider.dart';

class RiderRepository {
  final userProvider = RiderProvider();

  Future registerUser(
          {required String name,
          required String email,
          required String age,
          required String licenseNumber,
          required String password}) =>
      userProvider.registerRider(
          name: name,
          email: email,
          age: age,
          password: password,
          licenseNumber: licenseNumber);

  Future loginUser({required String email, required String password}) =>
      userProvider.userLogin(email: email, password: password);
}
