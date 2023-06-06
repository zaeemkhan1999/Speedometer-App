import 'package:flutter/cupertino.dart';
import 'package:com.zaeem.authapp.authapp/pages/auth/login.dart';
import 'package:com.zaeem.authapp.authapp/pages/auth/signup.dart';
import 'package:com.zaeem.authapp.authapp/pages/dashboard.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  LoginScreen.routeName: (ctx) => LoginScreen(),
  SignupScreen.routeName: (ctx) => SignupScreen(),
  DashboardPage.routeName: (ctx) => const DashboardPage(),
};
