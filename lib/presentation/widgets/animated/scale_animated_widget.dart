import 'package:flutter/material.dart';

class ScaleAnimatedWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Animation? animation;

  const ScaleAnimatedWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.curve = Curves.linear,
    this.animation,
  });

  @override
  State<ScaleAnimatedWidget> createState() => _AnimateWidgetState();
}

class _AnimateWidgetState extends State<ScaleAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final curve = CurvedAnimation(
      parent: _animationController,
      curve: widget.curve,
    );

    _animation =
        widget.animation ?? Tween<double>(begin: 0, end: 1).animate(curve);

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
    );
  }
}
