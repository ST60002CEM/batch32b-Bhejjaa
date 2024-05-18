import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

  class LoginScreen extends StatefulWidget {
    const LoginScreen({super.key});

    @override
    _LoginScreenState createState() => _LoginScreenState();
  }

  class _LoginScreenState extends State<LoginScreen> {
      TextEditingController _emailController = TextEditingController();
      TextEditingController _passwordController = TextEditingController();
      GlobalKey<FormState> _formKey = GlobalKey<FormState>();

      

    @override
    Widget build(BuildContext context) {
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
                Text(
                  'Login',
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
                ),
                SizedBox(height: 16),
                TextFormField(
                    validator: (value) {},
                ),
                SizedBox(height: 32),
                   ElevatedButton(
                               onPressed: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (_) => HomeScreen()));
                              },
                              child: Text("Login"),
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
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => RegistrationScreen()),
                        // );
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
      )
      );
    }
  }
