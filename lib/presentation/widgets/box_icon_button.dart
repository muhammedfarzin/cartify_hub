import 'package:flutter/material.dart';

class BoxIconButton extends StatelessWidget {
  const BoxIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.border,
    this.borderRadius,
    this.color,
    this.backgroundColor,
    this.iconSize,
    this.margin,
    this.padding,
  });

  final void Function() onPressed;
  final IconData icon;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? backgroundColor;
  final double? iconSize;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(horizontal: 3),
      child: Ink(
        decoration: ShapeDecoration(
          color: backgroundColor ?? colorScheme.inversePrimary,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5),
          ),
        ),
        child: InkWell(
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          splashColor: Colors.white.withOpacity(0.3),
          onTap: onPressed,
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
                border: border ??
                    Border.all(
                      color: colorScheme.primary,
                      width: 0.2,
                    ),
                borderRadius: borderRadius ?? BorderRadius.circular(5)),
            child: Icon(
              icon,
              size: iconSize,
              color: color ?? colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
