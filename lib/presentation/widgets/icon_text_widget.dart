import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final Widget icon;
  final String text;
  final double size;
  const IconTextWidget({
    super.key,
    required this.icon,
    required this.text,
    this.size = 70,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: colorScheme.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        height: size,
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon,
              Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
