import 'package:flutter/material.dart';
import 'package:com.zaeem.authapp.authapp/pages/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'bloc/rider/rider_bloc.dart';
import 'configs/routes.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RiderBloc()),
        // BlocProvider(create: (context) => CartProductBloc()),
      ],
      child: MaterialApp(
        // theme: robotheme,
        routes: routes,
        title: 'Flutter speedometer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
            bodyLarge: TextStyle(color: Colors.white, fontSize: 30),
          ),
          scaffoldBackgroundColor: Colors.black12,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              gapPadding: 0.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              gapPadding: 0.0,
            ),
          ),
          hintColor: Colors.grey.shade200,
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
