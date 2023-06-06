import 'package:flutter/material.dart';
import 'package:com.zaeem.authapp.authapp/pages/auth/login.dart';
import '../../bloc/rider/rider_bloc.dart';
import '../../configs/screen_size_config.dart';
import '../../widgets/buttons.dart';
import '../../widgets/textfields.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = 'signup-screen';
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController licenseNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
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
              TextFields.textField(
                controller: name,
                hint: 'Enter name',
              ),
              SizedBox(height: ScreenConfig.screenSizeHeight * 0.02),
              TextFields.textField(
                controller: email,
                hint: 'Enter email',
              ),
              SizedBox(height: ScreenConfig.screenSizeHeight * 0.02),
              TextFields.textField(
                controller: password,
                hint: 'Enter password',
                obsecure: true,
              ),
              SizedBox(height: ScreenConfig.screenSizeHeight * 0.02),
              TextFields.textField(
                controller: age,
                hint: 'Enter age',
              ),
              SizedBox(height: ScreenConfig.screenSizeHeight * 0.02),
              TextFields.textField(
                controller: licenseNumber,
                hint: 'Enter license number',
              ),
              SizedBox(height: ScreenConfig.screenSizeHeight * 0.02),
              BlocConsumer<RiderBloc, RiderState>(
                listener: (context, state) {
                  if (state is RegisterUser) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          'Registered Successfully. Please Login..',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    );
                    Navigator.pushNamed(context, LoginScreen.routeName);
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
                        Signup(
                          name: name.text,
                          email: email.text,
                          password: password.text,
                          licenseNumber: licenseNumber.text,
                          age: age.text,
                        ),
                      );
                    },
                    title: 'Get Started',
                  );
                },
              ),
              SizedBox(height: ScreenConfig.screenSizeHeight * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
