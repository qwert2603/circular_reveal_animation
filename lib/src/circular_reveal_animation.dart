import 'package:flutter/material.dart';
import 'package:circular_reveal_animation/src/circular_reveal_clipper.dart';

class CircularRevealAnimation extends StatelessWidget {
  final Offset center;
  final double minRadius;
  final double maxRadius;
  final Widget child;
  final Animation<double> animation;

  /// Creates [CircularRevealAnimation] with given params.
  /// For open animation [animation] should run forward: [AnimationController.forward].
  /// For close animation [animation] should run reverse: [AnimationController.reverse].
  ///
  /// [center] center of circular reveal. Child's center if not specified.
  /// [minRadius] minimum radius of circular reveal. 0 if not if not specified.
  /// [maxRadius] maximum radius of circular reveal. Distance from center to further child's corner if not specified.
  CircularRevealAnimation({
    @required this.child,
    @required this.animation,
    this.center,
    this.minRadius,
    this.maxRadius,
  })  : assert(child != null),
        assert(animation != null);

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
