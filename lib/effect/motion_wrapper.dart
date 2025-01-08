import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MotionWrapper extends StatefulWidget {
  final Widget child;
  final double maxAngle; // Maximum tilt angle in radians.

  const MotionWrapper({
    super.key,
    required this.child,
    this.maxAngle = 0.2, // Default tilt angle (0.2 radians ~ 11.5 degrees).
  });

  @override
  State<MotionWrapper> createState() => _MotionWrapperState();
}

class _MotionWrapperState extends State<MotionWrapper> {
  double _xAngle = 0.0;
  double _yAngle = 0.0;

  void _onPointerMoveDesktop(PointerHoverEvent event) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset center = box.size.center(Offset.zero);
    final Offset position = event.localPosition - center;

    setState(() {
      _yAngle = (position.dx / box.size.width) * widget.maxAngle; // Horizontal tilt.
      _xAngle = -(position.dy / box.size.height) * widget.maxAngle; // Vertical tilt.
    });
  }

  void _onPointerExitDesktop(PointerExitEvent event) {
    setState(() {
      _xAngle = 0.0;
      _yAngle = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isDesktop(context)
        ? MouseRegion(
            onHover: _onPointerMoveDesktop,
            onExit: _onPointerExitDesktop,
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // Perspective
                ..rotateX(_xAngle)
                ..rotateY(_yAngle),
              alignment: Alignment.center,
              child: widget.child,
            ),
          )
        : widget.child;
  }
}
