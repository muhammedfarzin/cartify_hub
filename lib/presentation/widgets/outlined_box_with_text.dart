import 'package:flutter/material.dart';

class OutlinedBoxWithText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  const OutlinedBoxWithText({
    super.key,
    required this.text,
    this.textColor,
    this.borderColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: borderColor ?? Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(3),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
