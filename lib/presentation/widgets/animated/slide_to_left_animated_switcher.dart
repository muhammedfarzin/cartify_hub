import 'package:flutter/material.dart';

class SlideToLeftAnimatedSwitcher extends StatefulWidget {
  const SlideToLeftAnimatedSwitcher({
    super.key,
    required this.firstWidget,
    required this.secondWidget,
    this.showSecondWidget = false,
    this.duration,
    this.curve = Curves.easeInOut,
  });

  final Widget firstWidget;
  final Widget secondWidget;
  final bool showSecondWidget;
  final Duration? duration;
  final Curve curve;

  @override
  State<SlideToLeftAnimatedSwitcher> createState() => _SlideAnimatedSwitcherState();
}

class _SlideAnimatedSwitcherState extends State<SlideToLeftAnimatedSwitcher> {
  @override
  Widget build(BuildContext context) {
    final Duration duration =
        widget.duration ?? const Duration(milliseconds: 500);
    final bool showSecondWidget = widget.showSecondWidget;
    final EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;
    final Size screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        // First Widget
        AnimatedPositioned(
          duration: duration,
          curve: widget.curve,
          left: showSecondWidget ? -screenSize.width : 0,
          top: safeAreaPadding.top,
          bottom: safeAreaPadding.bottom,
          child: SizedBox(
            height: screenSize.height - safeAreaPadding.vertical,
            width: screenSize.width,
            child: widget.firstWidget,
          ),
        ),

        // Second Widget
        AnimatedPositioned(
          duration: duration,
          curve: widget.curve,
          left: showSecondWidget ? 0 : screenSize.width,
          top: safeAreaPadding.top,
          bottom: safeAreaPadding.bottom,
          child: SizedBox(
            height: screenSize.height - safeAreaPadding.vertical,
            width: screenSize.width,
            child: widget.secondWidget,
          ),
        )
      ],
    );
  }
}
