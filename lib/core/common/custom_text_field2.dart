// lib/app/common/custom_text_field.dart
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final Function(String)? onChanged;
  final Color textColor; // Added textColor parameter
  final Color borderColor;
  final Color fillColor; // Added borderColor parameter
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  PasswordTextField({
    required this.labelText,
    this.isPassword = false,
    this.onChanged,
    required this.textColor, // Set a default value for textColor
    required this.borderColor, // Set a default value for borderColor
    required this.fillColor,
      this.controller,
    this.validator, required bool obscureText, required IconButton suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$labelText ',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText: isPassword,
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
              ),
              fillColor: fillColor,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}
