// ignore_for_file: depend_on_referenced_packages, unused_field

import 'dart:math' as math;
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

class WidgetItem {
  final String name;
  final Widget widget;
  vector.Vector3 position;
  double scale;
  final Color color;
  final Size widgetSize;

  WidgetItem({
    required this.name,
    required this.widget,
    required this.position,
    required this.color,
    required this.widgetSize,
    this.scale = 1.0,
  });
}

class GlobeOfWidgets extends StatefulWidget {
  final List<Widget> widgets;
  final double radius;
  final Color defaultColor;
  final Size itemSize;

  const GlobeOfWidgets({
    super.key,
    required this.widgets,
    this.radius = 150.0,
    this.defaultColor = Colors.white,
    this.itemSize = const Size(40, 40),
  });

  @override
  State<GlobeOfWidgets> createState() => _GlobeOfWidgetsState();
}

class _GlobeOfWidgetsState extends State<GlobeOfWidgets> with SingleTickerProviderStateMixin {
  List<WidgetItem> widgetItems = [];
  late AnimationController _controller;
  double _lastControllerValue = 0.0;
  MouseCursor globeCursor = SystemMouseCursors.grab;

  Offset _lastPanPosition = Offset.zero;
  vector.Vector2 _rotationVelocity = vector.Vector2.zero();
  bool _isInteracting = false;

  @override
  void initState() {
    super.initState();
    _initializeWidgets();
    _setupAnimation();
  }

  void _initializeWidgets() {
    if (widget.widgets.isEmpty) return;

    final distributionRadius = widget.radius - (widget.itemSize.width / 2) - 20;

    widgetItems = List.generate(widget.widgets.length, (index) {
      final phi = math.acos(-1.0 + (2.0 * index) / widget.widgets.length);
      final theta = math.sqrt(widget.widgets.length * math.pi) * phi;

      final x = distributionRadius * math.cos(theta) * math.sin(phi);
      final y = distributionRadius * math.sin(theta) * math.sin(phi);
      final z = distributionRadius * math.cos(phi);

      return WidgetItem(
        name: 'Widget $index',
        widget: widget.widgets[index],
        position: vector.Vector3(x, y, z),
        color: widget.defaultColor,
        widgetSize: widget.itemSize,
        scale: 1.0,
      );
    });
  }

  void _setupAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(_performAutoRotation);

    _controller.repeat();
  }

  void _performAutoRotation() {
    if (!mounted || widgetItems.isEmpty || _isInteracting) return;

    setState(() {
      final currentValue = _controller.value;
      final deltaValue = currentValue - _lastControllerValue;

      final adjustedDelta = deltaValue.abs() > 0.5 ? deltaValue.sign * (1 - deltaValue.abs()) : deltaValue;

      if (adjustedDelta.abs() > 0.0001) {
        final deltaRotation = adjustedDelta * 2 * math.pi * 0.1;
        final deltaRotationMatrix = vector.Matrix4.rotationY(deltaRotation);

        for (var item in widgetItems) {
          final transformed = deltaRotationMatrix.transform3(item.position);
          item.position
            ..x = transformed.x
            ..y = transformed.y
            ..z = transformed.z;
        }
      }

      _lastControllerValue = currentValue;
    });
  }

  void _handlePanStart(DragStartDetails details) {
    _isInteracting = true;
    _lastPanPosition = details.localPosition;
    _controller.stop();
    _lastControllerValue = _controller.value;
    setState(() {
      globeCursor = SystemMouseCursors.grabbing;
    });
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    if (!mounted || widgetItems.isEmpty) return;

    setState(() {
      final delta = details.localPosition - _lastPanPosition;

      final deltaX = -delta.dy * 0.005;
      final deltaY = delta.dx * 0.005;

      final deltaMatrixX = vector.Matrix4.rotationX(deltaX);
      final deltaMatrixY = vector.Matrix4.rotationY(deltaY);
      final combinedMatrix = deltaMatrixY..multiply(deltaMatrixX);

      for (var item in widgetItems) {
        final transformed = combinedMatrix.transform3(item.position);
        item.position
          ..x = transformed.x
          ..y = transformed.y
          ..z = transformed.z;
      }

      _rotationVelocity = vector.Vector2(deltaY, deltaX);
    });

    _lastPanPosition = details.localPosition;
  }

  void _handlePanEnd(DragEndDetails details) {
    _isInteracting = false;
    _controller.repeat();
    setState(() {
      globeCursor = SystemMouseCursors.grab;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widgetItems.isEmpty) {
      return SizedBox(
        width: widget.radius * 2,
        height: widget.radius * 2,
      );
    }

    final Widget globeContent = SizedBox(
      width: widget.radius * 2,
      height: widget.radius * 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (var item in widgetItems)
            Positioned(
              left: widget.radius + item.position.x - (item.widgetSize.width * item.scale / 2),
              top: widget.radius + item.position.y - (item.widgetSize.height * item.scale / 2),
              child: Opacity(
                opacity: math.max(
                  0.1,
                  math.min(1.0, (item.position.z + widget.radius) / (widget.radius * 2)),
                ),
                child: Transform.scale(
                  scale: item.scale,
                  child: SizedBox(
                    width: item.widgetSize.width,
                    height: item.widgetSize.height,
                    child: item.widget,
                  ),
                ),
              ),
            ),
        ],
      ),
    );

    return Center(
      child: isDesktop(context)
          ? MouseRegion(
              cursor: globeCursor,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanStart: _handlePanStart,
                onPanUpdate: _handlePanUpdate,
                onPanEnd: _handlePanEnd,
                child: globeContent,
              ),
            )
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanStart: _handlePanStart,
              onPanUpdate: _handlePanUpdate,
              onPanEnd: _handlePanEnd,
              child: globeContent,
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
