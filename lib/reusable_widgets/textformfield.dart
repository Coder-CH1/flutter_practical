import 'package:flutter/material.dart';

//CUSTOM TEXTFIELD
class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color? labelTextColor;
  final List<DropdownMenuItem>? items;
  final Function? onChanged;
  const CustomTextField({
    super.key, this.labelText,
    this.hintText,
    this.obscureText = false,
    this.inputType,
    this.controller,
    this.suffixIcon,
    this.icon,
    required this.onPressed,
    this.labelTextColor,
    this.items,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(
          color: labelTextColor,
        ),
        prefixIcon: icon != null ? Icon(icon) : null,
          suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        )
      ),
    );
  }
}