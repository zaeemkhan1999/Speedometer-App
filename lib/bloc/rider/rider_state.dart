part of 'rider_bloc.dart';

@immutable
abstract class RiderState {}

class RiderInitial extends RiderState {}

class ShowSplashScreen extends RiderState {}

class UserLoading extends RiderState {}

class UserLoggedIn extends RiderState {
  final Rider rider;

  UserLoggedIn({required this.rider});
}

class LogInError extends RiderState {
  final String error;

  LogInError({required this.error});
}

class RegisterUser extends RiderState {

  RegisterUser();
}

class SignupError extends RiderState {
  final String error;

  SignupError({required this.error});
}
