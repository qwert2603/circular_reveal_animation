import 'package:flutter/material.dart';
import 'package:circular_reveal_animation/src/circular_reveal_clipper.dart';

class CircularRevealAnimation extends StatelessWidget {
  final Alignment centerAlignment;
  final Offset centerOffset;
  final double minRadius;
  final double maxRadius;
  final Widget child;
  final Animation<double> animation;

  /// Creates [CircularRevealAnimation] with given params.
  /// For open animation [animation] should run forward: [AnimationController.forward].
  /// For close animation [animation] should run reverse: [AnimationController.reverse].
  ///
  /// [centerAlignment] center of circular reveal. [centerOffset] if not specified.
  /// [centerOffset] center of circular reveal. Child's center if not specified.
  /// [centerAlignment] or [centerOffset] must be null (or both).
  ///
  /// [minRadius] minimum radius of circular reveal. 0 if not if not specified.
  /// [maxRadius] maximum radius of circular reveal. Distance from center to further child's corner if not specified.
  CircularRevealAnimation({
    @required this.child,
    @required this.animation,
    @Deprecated("use centerOffset or centerAlignment") Offset center,
    this.centerAlignment,
    Offset centerOffset,
    this.minRadius,
    this.maxRadius,
  })  : assert(child != null),
        assert(animation != null),
        // ignore: deprecated_member_use_from_same_package
        centerOffset = centerOffset ?? center {
    assert(this.centerAlignment == null || this.centerOffset == null);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget _) {
        return ClipPath(
          clipper: CircularRevealClipper(
            fraction: animation.value,
            centerAlignment: centerAlignment,
            centerOffset: centerOffset,
            minRadius: minRadius,
            maxRadius: maxRadius,
          ),
          child: this.child,
        );
      },
    );
  }
}
