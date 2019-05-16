library circular_reveal_animation;

import 'package:flutter/material.dart';

import 'circular_reveal_clipper.dart';

class CircularRevealAnimation extends StatelessWidget {
  final Offset center;
  final double minRadius;
  final double maxRadius;
  final Widget child;
  final Animation<double> animation;

  CircularRevealAnimation({
    @required this.child,
    @required this.animation,
    this.center,
    this.minRadius,
    this.maxRadius,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget _) {
        return ClipPath(
          clipper: CircularRevealClipper(
            fraction: animation.value,
            center: center,
            minRadius: minRadius,
            maxRadius: maxRadius,
          ),
          child: this.child,
        );
      },
    );
  }
}
