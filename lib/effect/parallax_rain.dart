import 'package:flutter/material.dart';
import 'dart:math';

/// Create a cool 3D rain effect with layers, trails, and customizable properties.
class ParallaxRain extends StatefulWidget {
  ParallaxRain({
    super.key,
    this.numberOfDrops = 200,
    this.dropFallSpeed = 2.0,
    this.numberOfLayers = 3,
    this.dropHeight = 20,
    this.dropWidth = 2,
    this.dropColors = const [Colors.greenAccent],
    this.trailStartFraction = 0.3,
    this.distanceBetweenLayers = 1,
    this.child,
    this.rainIsInBackground = true,
    this.trail = true,
  })  : assert(numberOfLayers >= 1, "The minimum number of layers is 1"),
        assert(dropColors.isNotEmpty, "The drop colors list cannot be empty"),
        assert(distanceBetweenLayers > 0,
            "The distance between layers cannot be 0. Try setting the number of layers to 1 instead.");

  final int numberOfDrops;
  final double dropFallSpeed;
  final int numberOfLayers;
  final double dropHeight;
  final double dropWidth;
  final List<Color> dropColors;
  final double trailStartFraction;
  final bool trail;
  final double distanceBetweenLayers;
  final bool rainIsInBackground;
  final Widget? child;

  @override
  State<ParallaxRain> createState() => _ParallaxRainState();
}

class _ParallaxRainState extends State<ParallaxRain> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<RainDrop> _drops;

  @override
  void initState() {
    super.initState();

    // Initialize drops with random positions and layers
    _drops = List.generate(widget.numberOfDrops, (index) {
      final random = Random();
      return RainDrop(
        x: random.nextDouble(),
        y: random.nextDouble(),
        layer: random.nextInt(widget.numberOfLayers),
      );
    });

    // Animation controller for drop updates
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16), // ~60 FPS
    )..addListener(() {
        _updateDrops();
      });

    _controller.repeat();
  }

  void _updateDrops() {
    setState(() {
      for (var drop in _drops) {
        // Adjust drop position based on its layer speed
        drop.y += widget.dropFallSpeed * (1 + drop.layer * widget.distanceBetweenLayers) * 0.01;

        // Reset drop position if it goes off-screen
        if (drop.y > 1.0) {
          drop.y = 0.0;
          drop.x = Random().nextDouble();
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant ParallaxRain oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.numberOfDrops != widget.numberOfDrops ||
        oldWidget.dropColors != widget.dropColors ||
        oldWidget.dropFallSpeed != widget.dropFallSpeed ||
        oldWidget.numberOfLayers != widget.numberOfLayers) {
      // Recreate drops on configuration changes
      _drops = List.generate(widget.numberOfDrops, (index) {
        final random = Random();
        return RainDrop(
          x: random.nextDouble(),
          y: random.nextDouble(),
          layer: random.nextInt(widget.numberOfLayers),
        );
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        painter: widget.rainIsInBackground
            ? ParallaxRainPainter(
                drops: _drops,
                dropHeight: widget.dropHeight,
                dropWidth: widget.dropWidth,
                dropColors: widget.dropColors,
                trail: widget.trail,
                trailStartFraction: widget.trailStartFraction,
              )
            : null,
        foregroundPainter: widget.rainIsInBackground
            ? null
            : ParallaxRainPainter(
                drops: _drops,
                dropHeight: widget.dropHeight,
                dropWidth: widget.dropWidth,
                dropColors: widget.dropColors,
                trail: widget.trail,
                trailStartFraction: widget.trailStartFraction,
              ),
        child: widget.child,
      ),
    );
  }
}

class ParallaxRainPainter extends CustomPainter {
  final List<RainDrop> drops;
  final double dropHeight;
  final double dropWidth;
  final List<Color> dropColors;
  final bool trail;
  final double trailStartFraction;

  ParallaxRainPainter({
    required this.drops,
    required this.dropHeight,
    required this.dropWidth,
    required this.dropColors,
    required this.trail,
    required this.trailStartFraction,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (var drop in drops) {
      final x = drop.x * size.width;
      final y = drop.y * size.height;

      // Determine color based on layer
      final color = dropColors[drop.layer % dropColors.length];
      paint.color = color.withOpacity(1.0 / (drop.layer + 1));

      // Define drop rect
      final Rect dropRect = Rect.fromLTWH(x, y, dropWidth, dropHeight);

      if (trail) {
        final Shader shader = LinearGradient(
          colors: [paint.color, Colors.transparent],
          stops: [trailStartFraction, 1.0],
        ).createShader(dropRect);
        paint.shader = shader;
        canvas.drawRect(dropRect, paint);
      } else {
        paint.shader = null;
        canvas.drawRect(dropRect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// Represents a single raindrop with position and layer data
class RainDrop {
  double x; // Horizontal position (normalized: 0.0 to 1.0)
  double y; // Vertical position (normalized: 0.0 to 1.0)
  int layer; // Parallax layer

  RainDrop({
    required this.x,
    required this.y,
    required this.layer,
  });
}
