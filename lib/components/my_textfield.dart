import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController controller;
  const MyTextfield({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        fillColor: Theme.of(
          context,
        ).colorScheme.secondary.withValues(alpha: 0.4),
        filled: true,
        prefixIcon: Icon(prefixIcon),
        labelText: hintText,
      ),
    );
  }
}
