import 'package:flutter/material.dart';

class RoundedBoxWithText extends StatelessWidget {
  const RoundedBoxWithText({
    super.key,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.borderRadius,
  });

  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
