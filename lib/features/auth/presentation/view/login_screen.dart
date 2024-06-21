import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_vault/core/common/custom_button.dart';
import 'package:vendor_vault/core/common/custom_text_field.dart';
import 'package:vendor_vault/core/common/custom_text_field2.dart';
import 'package:vendor_vault/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:vendor_vault/features/auth/presentation/view/registration_screen.dart';
import 'package:vendor_vault/features/home/presentation/view/home_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'Bhejja');
  final _passwordController = TextEditingController(text: 'Bhejja123');
  bool obscureTextVal = true;
  final _gap = SizedBox(height: 32);

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
              _gap,
              Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 198, 185, 65)),
                textAlign: TextAlign.center,
              ),
              _gap,
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
                suffixIcon: IconButton(
                  icon: Icon(
                      obscureTextVal ? Icons.visibility : Icons.visibility_off),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      obscureTextVal = !obscureTextVal;
                    });
                  },
                ),
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
              _gap,
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: "Login",
                  onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
                  width: 10, // Adjust this value as needed
                  height: 50, // Adjust this value as needed
                  labelColor: Colors.black,
                ),
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
                      ref
                          .read(authViewModelProvider.notifier)
                          .openRegistrationScreen();
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
