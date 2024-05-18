// lib/common/custom_button.dart
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  
  final VoidCallback onPressed;
  final bool isLoading;
  final double width;
  final double height;
  final Color labelColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    required this.width,
    required this.height,
    this.labelColor = Colors.black
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          
          backgroundColor: Color.fromARGB(255, 196, 183, 59),
          
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.zero,
          )
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: const TextStyle(fontSize: 25, color: Colors.black),
              ),
      ),
    );
  }
}
