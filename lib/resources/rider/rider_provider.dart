import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiderProvider {
  // final userBaseServerAuth = serverUrl + 'api/user/auth/';
  Future registerRider(
      {required String email,
      required String password,
      required String name,
      required String age,
      required String licenseNumber}) async {
    print('registering');
    try {
      final db = FirebaseFirestore.instance;
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await db.doc('users/${userCredential.user?.uid}').set({
        'name': name,
        'email': email,
        'age': age,
        'licenseNumber': licenseNumber
      });
      return true;
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     backgroundColor: Colors.green,
      //     content: Text(
      //       'Registered Successfully. Please Login..',
      //       style: TextStyle(fontSize: 20.0),
      //     ),
      //   ),
      // );
      // Navigator.pushNamed(context, LoginScreen.routeName);
    } on FirebaseAuthException catch (e) {
      throw e.code;
      // if (e.code == 'weak-password') {
      //   throw e.code;
      //   // debugPrint('Password Provided is too Weak');
      //   // ScaffoldMessenger.of(context).showSnackBar(
      //   //   const SnackBar(
      //   //     backgroundColor: Colors.orangeAccent,
      //   //     content: Text(
      //   //       'Password Provided is too Weak',
      //   //       style: TextStyle(fontSize: 18.0, color: Colors.black),
      //   //     ),
      //   //   ),
      //   // );
      // } else if (e.code == 'email-already-in-use') {
      //   // debugPrint('Account Already exists');
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //       backgroundColor: Colors.orangeAccent,
      //       content: Text(
      //         'Account Already exists',
      //         style: TextStyle(fontSize: 18.0, color: Colors.black),
      //       ),
      //     ),
      //   );
      // }
    }
  }

  Future userLogin({required String email, required String password}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
      // debugPrint(userCredential.user?.uid);
      // await _storage.write(key: 'uid', value: userCredential.user?.uid);
      // if (!mounted) return;
      // Navigator.pushNamed(context, DashboardPage.routeName);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }
}
