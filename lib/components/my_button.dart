import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonName;
  const MyButton({super.key, required this.buttonName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(20),
        child: Center(child: Text(buttonName)),
      ),
    );
  }
}
