import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_vault/core/common/custom_button.dart';
import 'package:vendor_vault/core/common/custom_text_field.dart';
import 'package:vendor_vault/core/common/custom_text_field2.dart';
import 'package:vendor_vault/features/auth/domain/entity/auth_entity.dart';
import 'package:vendor_vault/features/auth/presentation/viewmodel/auth_view_model.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final _gap = const SizedBox(height: 32);
  final _formKey = GlobalKey<FormState>();

  final _fnameController = TextEditingController(text: 'Pujendra');
  final _lnameController = TextEditingController(text: 'Thapa');
  final _usernameController = TextEditingController(text: 'Bhejjaa');
  final _passwordController = TextEditingController(text: 'Bhejja123');
  final _confpasswordController = TextEditingController();
  final _phoneController = TextEditingController(text: '9861284066');

  List<String> typeOfAccount = <String>['Customer', 'Vendor'];
  String dropDownValue = 'Customer';
  bool isChecked = false;
  bool obscureTextVal = true;

  void registerUser(AuthViewModel authViewModel) {
    if (_formKey.currentState!.validate()) {
      var user = AuthEntity(
        fname: _fnameController.text,
        lname: _lnameController.text,
        username: _usernameController.text,
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
                _gap,
                Text(
                  'Create an account',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 198, 185, 65)),
                  textAlign: TextAlign.center,
                ),
                _gap,
                Center(
                  child: SvgPicture.asset(
                    'assets/icons/logo.svg',
                    height: 80,
                  ),
                ),
                _gap,
                CustomTextField(
                  labelText: 'First Name',
                  controller: _fnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
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
                  labelText: 'Last Name',
                  controller: _lnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  obscureText: true,
                  suffixIcon: IconButton(
                    icon: Icon(obscureTextVal
                        ? Icons.visibility
                        : Icons.visibility_off),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        obscureTextVal = !obscureTextVal;
                      });
                    },
                  ),
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
                SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Phone number',
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  isPassword: false,
                  textColor: Colors.black,
                  fillColor: Color.fromARGB(255, 168, 162, 162),
                  borderColor: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                      width: 150, // Adjust width as per your design
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Type of Account',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: dropDownValue,
                        style: const TextStyle(color: Colors.black),
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
                            horizontal: 12,
                            vertical: 12,
                          ),
                          fillColor: Color.fromARGB(255, 168, 162, 162),
                          filled: true,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: "Select account type",
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                _gap,
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "By submitting this form I agree to the Terms and Conditions.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                _gap,
                Center(
                  child: CustomButton(
                    text: 'Confirm',
                    onPressed: isChecked
                        ? () => registerUser(
                            ref.read(authViewModelProvider.notifier))
                        : () {},
                    width: 200,
                    height: 50,
                    labelColor: Colors.white,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
