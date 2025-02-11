import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension ShimmerExtension on Widget {
  Widget appShimmer({
    Color? baseColor,
    Color? highlightColor,
    Duration? period,
  }) {
    return animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 1200.ms, color: Colors.white)
        .animate()
        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad);
  }
}
