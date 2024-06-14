import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_vault/core/common/custom_button.dart';
import 'package:vendor_vault/core/common/custom_text_field.dart';
import 'package:vendor_vault/screens/login_screen.dart';
import 'package:vendor_vault/features/auth/domain/entity/auth_entity.dart';
import 'package:vendor_vault/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:vendor_vault/screens/registration_screen.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confpasswordController = TextEditingController();

  List<String> typeOfAccount = <String>['Customer', 'Vendor'];
  String dropDownValue = 'Customer';
  bool isChecked = false;
  bool obscureTextVal = true;

  void registerUser(AuthViewModel authViewModel) {
    if (_formKey.currentState!.validate()) {
      var user = AuthEntity(
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        phone: _phoneController.text,
        accountType: dropDownValue,
      );

      ref.read(authViewModelProvider.notifier).registerUser(user);

      print('User Details: $user');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User registered successfully')),
      );
    }
  }

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
              SizedBox(height: 40),
              Text(
                'Create an account',
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
              CustomTextField(
                labelText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                isPassword: false,
                textColor: Colors.black,
                fillColor: Color.fromARGB(255, 168, 162, 162),
                borderColor: Colors.grey.shade400,
              ),
              SizedBox(height: 16),
              CustomTextField(
                labelText: 'Username',
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
              CustomTextField(
                labelText: 'Password',
                controller: _passwordController,
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
              SizedBox(height: 16),
              CustomTextField(
                labelText: 'Confirm Password',
                controller: _confpasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                isPassword: true,
                textColor: Colors.black,
                fillColor: Color.fromARGB(255, 168, 162, 162),
                borderColor: Colors.grey.shade400,
              ),
              const SizedBox(height: 32),
              CustomTextField(
                labelText: 'Phone number',
                controller: _phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  } 
                  return null;
                },
                isPassword: true,
                textColor: Colors.black,
                fillColor: Color.fromARGB(255, 168, 162, 162),
                borderColor: Colors.grey.shade400,
              ),
              const SizedBox(height: 32),
                    DropdownButtonFormField<String>(
                    value: dropDownValue,
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                      });
                    },
                    items: typeOfAccount
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      fillColor: Color.fromARGB(255, 168, 162, 162),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "Type of Account",
                      hintStyle:
                          const TextStyle(color: Colors.black45, fontSize: 19),
                      prefixIcon: const Icon(Icons.house),
                    ),
                  ),
              const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue!;
                        });
                      },
                    ),
                    const Text(
                      "By submitting this form I agree to the Terms\nand Conditions.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              Center(
                // Center the button horizontally
               child: MaterialButton(
                    onPressed: isChecked
                        ? () => registerUser(ref.read(authViewModelProvider.notifier))
                        : null,
                    color:
                        isChecked ? Colors.deepPurpleAccent[200] : Colors.white,
                    textColor: isChecked ? Colors.white : Colors.grey,
                    disabledColor: const Color.fromARGB(255, 186, 146, 255),
                    child: const Text(
                      'Confirm',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
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
    ));
  }
}
