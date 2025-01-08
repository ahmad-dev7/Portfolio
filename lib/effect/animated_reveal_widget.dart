import 'package:flutter/material.dart';

class AnimatedRevealWidget extends StatefulWidget {
  final Widget child;
  final AnimationType animationType;
  final Duration animationDuration;
  final Curve animationCurve;
  final Duration animationDelay;
  final double animateAtViewport;

  const AnimatedRevealWidget({
    super.key,
    required this.child,
    this.animationType = AnimationType.fadeInFromTop,
    this.animationDuration = const Duration(milliseconds: 550),
    this.animationDelay = Duration.zero,
    this.animationCurve = Curves.easeOut,
    this.animateAtViewport = 0.2,
  }) : assert(
          animateAtViewport > 0 && animateAtViewport <= 1,
          'animateAtViewport must be >= 0 && <=1. It represents the fraction of the widget that must be visible in the viewport to start the animation. Default is 0.3 (30%)',
        );

  @override
  State<AnimatedRevealWidget> createState() => _AnimatedRevealWidgetState();
}

enum AnimationType {
  fade,
  slideFromLeft,
  slideFromRight,
  slideFromTop,
  slideFromBottom,
  scaleUp,
  scaleDown,
  rotate,
  slideFromTopLeft,
  slideFromTopRight,
  slideFromBottomLeft,
  slideFromBottomRight,
  fadeInFromLeft,
  fadeInFromRight,
  fadeInFromTop,
}

class _AnimatedRevealWidgetState extends State<AnimatedRevealWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _scale;
  late Animation<Offset> _offset;
  late Animation<double> _rotation;

  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _opacity = Tween<double>(
      begin: _getOpacityBegin(),
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: widget.animationCurve),
    );

    _offset = Tween<Offset>(
      begin: _getOffset(),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: widget.animationCurve),
    );

    _scale = Tween<double>(
      begin: _getScale(),
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: widget.animationCurve),
    );

    _rotation = Tween<double>(
      begin: _getRotation(),
      end: 0.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: widget.animationCurve),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  double _getOpacityBegin() {
    switch (widget.animationType) {
      case AnimationType.fadeInFromLeft:
      case AnimationType.fadeInFromRight:
      case AnimationType.fadeInFromTop:
        return 0.0;
      default:
        return 1.0;
    }
  }

  Offset _getOffset() {
    switch (widget.animationType) {
      case AnimationType.slideFromLeft:
      case AnimationType.fadeInFromLeft:
        return const Offset(-1, 0);
      case AnimationType.slideFromRight:
      case AnimationType.fadeInFromRight:
        return const Offset(1, 0);
      case AnimationType.slideFromTop:
      case AnimationType.fadeInFromTop:
        return const Offset(0, -1);
      case AnimationType.slideFromBottom:
        return const Offset(0, 1);
      case AnimationType.slideFromTopLeft:
        return const Offset(-1, -1);
      case AnimationType.slideFromTopRight:
        return const Offset(1, -1);
      case AnimationType.slideFromBottomLeft:
        return const Offset(-1, 1);
      case AnimationType.slideFromBottomRight:
        return const Offset(1, 1);
      default:
        return Offset.zero;
    }
  }

  double _getScale() {
    switch (widget.animationType) {
      case AnimationType.scaleUp:
        return 0.5;
      case AnimationType.scaleDown:
        return 1.5;
      default:
        return 1.0;
    }
  }

  double _getRotation() {
    return widget.animationType == AnimationType.rotate ? -0.5 : 0.0;
  }

  void _checkVisibility() {
    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject is RenderBox) {
      final RenderBox renderBox = renderObject;
      final Offset position = renderBox.localToGlobal(Offset.zero);
      final Size widgetSize = renderBox.size;
      final Size screenSize = MediaQuery.of(context).size;

      final double widgetTop = position.dy;
      final double widgetBottom = widgetTop + widgetSize.height;

      final double visibleTop = widgetTop < 0 ? 0 : widgetTop;
      final double visibleBottom = widgetBottom > screenSize.height ? screenSize.height : widgetBottom;
      final double visibleHeight = visibleBottom - visibleTop;

      if (visibleHeight >= widgetSize.height * widget.animateAtViewport && !_isAnimating) {
        setState(() {
          _isAnimating = true;
        });
        Future.delayed(widget.animationDelay).then((value) {
          _controller.forward().then((_) {
            _controller.reset();
            setState(() => _isAnimating = false);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: _opacity,
          child: ScaleTransition(
            scale: _scale,
            child: RotationTransition(
              turns: _rotation,
              child: SlideTransition(
                position: _offset,
                child: child,
              ),
            ),
          ),
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
