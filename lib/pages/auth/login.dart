import 'package:flutter/material.dart';
import 'package:com.zaeem.authapp.authapp/pages/auth/signup.dart';
import 'package:com.zaeem.authapp.authapp/pages/dashboard.dart';
import 'package:com.zaeem.authapp.authapp/widgets/buttons.dart';
import 'package:com.zaeem.authapp.authapp/widgets/textfields.dart';
import '../../bloc/rider/rider_bloc.dart';
import '../../configs/screen_size_config.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login-screen';
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LottieBuilder.asset(
                'assets/animations/bikerider.json',
                width: ScreenConfig.screenSizeHeight * 0.5,
              ),
              const SizedBox(height: 10),
              TextFields.textField(
                // key: const Key('emailTextField'),
                controller: email,
                hint: 'Enter email',
              ),
              SizedBox(height: ScreenConfig.screenSizeHeight * 0.04),
              TextFields.textField(
                // key: const Key('passwordTextField'),
                controller: password,
                hint: 'Enter password',
                obsecure: true,
              ),
              SizedBox(height: ScreenConfig.screenSizeHeight * 0.1),
              BlocConsumer<RiderBloc, RiderState>(
                listener: (context, state) {
                  if (state is UserLoggedIn) {
                    Navigator.pushNamed(context, DashboardPage.routeName);
                  } else if (state is LogInError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.orangeAccent,
                        content: Text(
                          state.error,
                          style: const TextStyle(
                              fontSize: 18.0, color: Colors.black),
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is UserLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ScreenConfig.theme.primaryColor,
                      ),
                    );
                  }
                  return Buttons.neopopButton(
                    onTap: () {
                      BlocProvider.of<RiderBloc>(context).add(
                        Login(email: email.text, password: password.text),
                      );
                      // userLogin();
                    },
                    title: 'Let\'s Go...',
                  );
                },
              ),
              SizedBox(height: ScreenConfig.screenSizeHeight * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignupScreen.routeName);
                },
                child: const Text('Don\'t have an account? Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
