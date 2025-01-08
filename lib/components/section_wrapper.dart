import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;
  final AnimationType animationType;
  final Duration duration;
  final double atViewport;
  const SectionWrapper({
    super.key,
    required this.child,
    this.animationType = AnimationType.fadeInLeft,
    this.duration = Durations.medium1,
    this.atViewport = 0,
  });

  @override
  Widget build(BuildContext context) {
    var isVisible = false.obs;

    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (visibilityInfo) => isVisible.value = visibilityInfo.visibleFraction > atViewport,
      child: Obx(
        () {
          return switch (animationType) {
            AnimationType.fadeIn => FadeIn(animate: isVisible.value, duration: duration, child: child),
            AnimationType.fadeInRight => FadeInRight(animate: isVisible.value, duration: duration, child: child),
            AnimationType.fadeInLeft => FadeInLeft(animate: isVisible.value, duration: duration, child: child),
            AnimationType.fadeInUp => FadeInUp(animate: isVisible.value, duration: duration, child: child),
            AnimationType.fadeInDown => FadeInDown(animate: isVisible.value, duration: duration, child: child),
            AnimationType.slideInRight => SlideInRight(animate: isVisible.value, duration: duration, child: child),
            AnimationType.slideInLeft => SlideInLeft(animate: isVisible.value, duration: duration, child: child),
            AnimationType.slideInUp => SlideInUp(animate: isVisible.value, duration: duration, child: child),
            AnimationType.slideInDown => SlideInDown(animate: isVisible.value, duration: duration, child: child),
            AnimationType.zoomIn => ZoomIn(animate: isVisible.value, duration: duration, child: child)
          };
        },
      ),
    );
  }
}

enum AnimationType {
  //* Fade Types
  fadeIn,
  fadeInRight,
  fadeInLeft,
  fadeInUp,
  fadeInDown,

  //* Slide Types
  slideInRight,
  slideInLeft,
  slideInUp,
  slideInDown,

  //* Zoom
  zoomIn,

  //* No animation
}
