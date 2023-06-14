
import 'package:cartify_hub/presentation/widgets/box_icon_button.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final ValueNotifier<int> count = ValueNotifier(1);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Row(
        children: [
          Flexible(
            child: BoxIconButton(
              onPressed: () {
                count.value--;
              },
              icon: Icons.remove_rounded,
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
                child: ValueListenableBuilder(
                  valueListenable: count,
                  builder: (context, value, child) {
                    return Text("$value");
                  },
                ),
              ),
            ),
          ),
          Flexible(
            child: BoxIconButton(
              onPressed: () {
                count.value++;
              },
              icon: Icons.add_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
