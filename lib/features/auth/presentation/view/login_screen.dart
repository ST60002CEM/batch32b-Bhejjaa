import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_vault/core/common/custom_button.dart';
import 'package:vendor_vault/core/common/custom_text_field.dart';
import 'package:vendor_vault/core/common/custom_text_field2.dart';
import 'package:vendor_vault/screens/dashboard_screen.dart';
import 'package:vendor_vault/screens/registration_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscureTextVal = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 80),
              Center(
                child: SvgPicture.asset(
                  'assets/icons/logo.svg',
                  height: 80,
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 198, 185, 65)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              CustomTextField(
                labelText: 'Username',
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                isPassword: false,
                textColor: Colors.black,
                fillColor: Color.fromARGB(255, 168, 162, 162),
                borderColor: Colors.grey.shade400,
              ),
              SizedBox(height: 16),
              PasswordTextField(
                labelText: 'Password',
                controller: _passwordController,
                obscureText: obscureTextVal,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                isPassword: true,
                textColor: Colors.black,
                fillColor: Color.fromARGB(255, 168, 162, 162),
                borderColor: Colors.grey.shade400,
              ),
              SizedBox(height: 32),
              Center(
                // Center the button horizontally
                child: CustomButton(
                  text: 'Login',
                  height: 50,
                  width: 200, // Set a reasonable width
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                "OR",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(height: 16),
              Text(
                '---------Sign in with---------',
                style: TextStyle(
                  fontSize: 26,
                  color: Color.fromARGB(255, 198, 185, 65),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/google_icon.svg',
                      height: 50,
                      width: 50,
                    ),
                  ),
                  SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      // Login with Facebook
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/facebook_icon.svg',
                      width: 50.0,
                      height: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Need an account,",
                    style: TextStyle(
                        color: Color.fromARGB(255, 198, 185, 65), fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()),
                      );
                    },
                    child: const Text(
                      'sign up',
                      style: TextStyle(
                        color: Color.fromARGB(255, 198, 185, 65),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
