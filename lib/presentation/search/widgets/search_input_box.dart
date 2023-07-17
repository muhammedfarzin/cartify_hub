import 'package:flutter/material.dart';

class SearchInputBox extends StatelessWidget {
  const SearchInputBox({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.decoration,
    this.autoFocus = true,
    this.boxColor,
    this.borderRadius,
  });

  final TextEditingController controller;
  final Function(String)? onSubmitted;
  final InputDecoration? decoration;
  final bool autoFocus;
  final Color? boxColor;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: boxColor ?? colorScheme.background,
        borderRadius: borderRadius ?? BorderRadius.circular(5),
      ),
      child: TextFormField(
        controller: controller,
        autofocus: autoFocus,
        onFieldSubmitted: onSubmitted,
        decoration: decoration ??
            InputDecoration(
              hintText: "Search for Products",
              filled: true,
              fillColor: boxColor ?? colorScheme.background,
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () {
                  controller.clear();
                },
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            ),
      ),
    );
  }
}
