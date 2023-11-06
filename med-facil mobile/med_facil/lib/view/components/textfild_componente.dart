import 'package:flutter/material.dart';

class TextFieldComponente extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const TextFieldComponente({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}
