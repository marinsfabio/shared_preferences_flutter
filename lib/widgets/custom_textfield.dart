import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final Function(String) onChanged;
  final String label;
  final bool obscureText;

  const CustomTextfield({
    super.key,
    required this.onChanged,
    required this.label,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          label: Text(
        label,
      )),
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}