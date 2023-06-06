import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/rider.dart';
import '../../resources/rider/rider_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'rider_event.dart';
part 'rider_state.dart';

class RiderBloc extends Bloc<RiderEvent, RiderState> {
  final _repository = RiderRepository();

  RiderBloc() : super(RiderInitial()) {
    on<Logout>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('user');
      emit(RiderInitial());
    });
    //User Signup
    on<Signup>((event, emit) async {
      emit(UserLoading());
      try {
        final response = await _repository.registerUser(
          name: event.name,
          email: event.email,
          licenseNumber: event.licenseNumber,
          age: event.age,
          password: event.password,
        );
        if (response == true) {
          emit(RegisterUser());
        }
      } catch (e) {
        emit(SignupError(error: e.toString()));
      }
    });

    //User Error
    on<ResetState>((event, emit) async {
      if (event.stateNameToReset == "UserInitial") {
        emit(RiderInitial());
      }
    });
    //check if logged in
    on<CheckIfLoggedIn>(
      ((event, emit) async {
        emit(UserLoading());
        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          final List<String>? user = prefs.getStringList('user');
          if (user != null) {
            final response =
                await _repository.loginUser(email: user[0], password: user[1]);
            if (response.runtimeType == Rider) {
              emit(UserLoggedIn(rider: response));
            } else {
              emit(LogInError(error: response['message']));
            }
          } else {
            emit(RiderInitial());
          }
        } catch (e) {
          emit(LogInError(error: e.toString()));
        }
      }),
    );

    //login
    on<Login>((event, emit) async {
      emit(UserLoading());
      try {
        final UserCredential response = await _repository.loginUser(
            email: event.email, password: event.password);
        print(response);
        DocumentSnapshot<Map<String, dynamic>> data;
        data = await FirebaseFirestore.instance
            .collection('users')
            .doc(response.user?.uid)
            .get();
        print(data);
        print(data.data());
        print(data.data()!['name']);
        emit(UserLoggedIn(rider: Rider.fromJson(data.data()!)));
      } catch (e) {
        emit(LogInError(error: e.toString()));
      }
    });
  }
}
