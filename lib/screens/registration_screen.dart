import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Text(
                'Register',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 198, 185, 65)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Center(
                child: SvgPicture.asset(
                  'assets/icons/logo.svg',
                  height: 80,
                ),
              ),
              SizedBox(height: 32),
             TextFormField(
                    validator: (value) {},
                    decoration: InputDecoration(hintText: "Email"),
                ),
              SizedBox(height: 16),
             TextFormField(
                    validator: (value) {},
                    decoration: InputDecoration(hintText: "Username"),

                ),
              SizedBox(height: 16),
             TextFormField(
                    validator: (value) {},
                    decoration: InputDecoration(hintText: "Password"),
                ),
              SizedBox(height: 16),
              TextFormField(
                    validator: (value) {},
                    decoration: InputDecoration(hintText: "Email"),

                ),
              const SizedBox(height: 32),
              Center(
                // Center the button horizontally
                
              ),
              const SizedBox(height: 16),
              const Text(
                "OR",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 16),
              const Text(
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
            ],
          ),
        ),
      ),
    );
  }
}
