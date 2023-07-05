import 'package:cartify_hub/presentation/widgets/box_icon_button.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final bool isRemoveAtZero;
  const CounterWidget({
    super.key,
    this.isRemoveAtZero = false,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Row(
        children: [
          Flexible(
            child: BoxIconButton(
              onPressed: () {
                setState(() {
                  if (widget.isRemoveAtZero) {
                    if (count > 1) {
                      count--;
                    }
                  } else {
                    count--;
                  }
                });
              },
              icon: widget.isRemoveAtZero && count <= 1
                  ? Icons.delete
                  : Icons.remove_rounded,
            ),
          ),
          Flexible(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: colorScheme.inversePrimary.withOpacity(0.2),
                    border: Border.all(
                      color: colorScheme.inversePrimary,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Text("$count"),
              ),
            ),
          ),
          Flexible(
            child: BoxIconButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              icon: Icons.add_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
