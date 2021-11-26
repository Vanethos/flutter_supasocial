import 'package:flutter/material.dart';

class LoginScreenForm extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController controller;

  const LoginScreenForm({
    Key? key,
    required this.hint,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondaryVariant,
            width: 1.0,
          ),
        ),
        hintText: hint,
      ),
    );
  }
}
