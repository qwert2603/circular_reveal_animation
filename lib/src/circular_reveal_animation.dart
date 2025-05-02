import 'package:flutter/material.dart';
import 'package:circular_reveal_animation/src/circular_reveal_clipper.dart';

class CircularRevealAnimation extends StatelessWidget {
  final Alignment? centerAlignment;
  final Offset? centerOffset;
  final double? minRadius;
  final double? maxRadius;
  final Widget child;
  final Animation<double> animation;

  /// if true, the clip will be applied even when the animation is complete. Default is false.
  final bool sustainClip;

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
    required this.child,
    required this.animation,
    this.centerAlignment,
    this.centerOffset,
    this.minRadius,
    this.maxRadius,
    this.sustainClip = false,
  }) : assert(centerAlignment == null || centerOffset == null);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        // if animation is complete (fully revealed), don't clip at all. (discussed in https://github.com/qwert2603/circular_reveal_animation/issues/9)
        return !sustainClip && animation.value == 1
            ? child!
            : ClipPath(
                clipper: CircularRevealClipper(
                  fraction: animation.value,
                  centerAlignment: centerAlignment,
                  centerOffset: centerOffset,
                  minRadius: minRadius,
                  maxRadius: maxRadius,
                ),
                child: child,
              );
      },
      child: this.child,
    );
  }
}
