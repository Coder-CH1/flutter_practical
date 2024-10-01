import 'package:flutter/material.dart';

//Custom TextField
class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final IconData? icon;
  const CustomTextField({super.key, this.labelText, this.hintText, this.obscureText = false, this.keyboardType, this.controller, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        )
      ),
    );
  }
}