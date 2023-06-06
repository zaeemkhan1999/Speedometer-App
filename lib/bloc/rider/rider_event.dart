part of 'rider_bloc.dart';

@immutable
abstract class RiderEvent {}

class CheckIfLoggedIn extends RiderEvent {}

class Login extends RiderEvent {
  final String email, password;

  Login({required this.email, required this.password});
}

class Logout extends RiderEvent {}

class Signup extends RiderEvent {
  final String name;
  final String email;
  final String age;
  final String licenseNumber;
  final String password;

  Signup({
    required this.name,
    required this.email,
    required this.password,
    required this.licenseNumber,
    required this.age,
  });
}

class ResetState extends RiderEvent {
  final String stateNameToReset;

  ResetState({required this.stateNameToReset});
}

class ToUserLoggedInState extends RiderEvent {
  final Rider rider;

  ToUserLoggedInState({required this.rider});
}

// class UpdateProfile extends RiderEvent {
//   final Rider rider;
//
//   UpdateProfile({required this.user});
// }
