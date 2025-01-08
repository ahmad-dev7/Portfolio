import 'dart:async';
import 'dart:math';
import 'package:aali_portfolio/constants/my_text.dart';
import 'package:flutter/material.dart';

class AnimatedTransformingCard extends StatefulWidget {
  final Map<String, String> card;
  final Widget? logo;
  final void Function()? onTap;
  final bool showAnimation;
  final double height;
  final double width;
  final Color color;

  const AnimatedTransformingCard({
    super.key,
    required this.card,
    this.onTap,
    this.showAnimation = true,
    this.height = 270.0,
    this.width = 230.0,
    this.logo,
    this.color = Colors.purpleAccent,
  });

  @override
  State<AnimatedTransformingCard> createState() => _AnimatedTransformingCardState();
}

class _AnimatedTransformingCardState extends State<AnimatedTransformingCard> with SingleTickerProviderStateMixin {
  double _angleX = 0;
  double _angleY = 0;
  bool _isHovered = false;
  Timer? _hoverTimer;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _controller.addListener(() {
      setState(() {
        _angleX = _controller.value * 15;
        _angleY = _controller.value * 15;
      });
    });
  }

  void _onHover(PointerEvent event, Size cardSize) {
    final x = event.localPosition.dx;
    final y = event.localPosition.dy;

    final dx = (x - cardSize.width / 2) / (cardSize.width / 2);
    final dy = (y - cardSize.height / 2) / (cardSize.height / 2);

    setState(() {
      _angleY = dx * 15;
      _angleX = dy * -15;
      _isHovered = true;
    });

    _hoverTimer?.cancel();
  }

  void _onExit(PointerEvent event) {
    _hoverTimer = Timer(const Duration(seconds: 0), () {
      _controller.reverse(from: 1.0);
      setState(() {
        _isHovered = false;
      });
    });
  }

  @override
  void dispose() {
    _hoverTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size cardSize = Size(widget.width, widget.height);
    return MouseRegion(
      onHover: (event) => _onHover(event, cardSize),
      onExit: _onExit,
      child: InkWell(
        onTap: widget.onTap,
        child: _buildCardContent(),
      ),
    );
  }

  Widget _buildCardContent() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return widget.showAnimation
            ? Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateX(_angleX * pi / 180)
                  ..rotateY(_angleY * pi / 180),
                alignment: FractionalOffset.center,
                child: CardWidget(
                  card: widget.card,
                  isHovered: _isHovered,
                  widget: widget,
                  logo: widget.logo,
                ),
              )
            : CardWidget(
                card: widget.card,
                isHovered: _isHovered,
                widget: widget,
                logo: widget.logo,
              );
      },
    );
  }
}

class CardWidget extends StatelessWidget {
  final AnimatedTransformingCard widget;
  final Widget? logo;
  final Map<String, String> card;
  final bool isHovered;

  const CardWidget({
    super.key,
    required this.widget,
    required this.card,
    required this.isHovered,
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: isHovered ? 1.08 : 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).dividerColor.withOpacity(.4),
              offset: const Offset(4.0, 4.0),
              blurRadius: 1,
            ),
            BoxShadow(
              color: Theme.of(context).hoverColor,
              offset: const Offset(-4.0, -4.0),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: isHovered ? 1 : 0.9,
              duration: const Duration(milliseconds: 400),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                padding: EdgeInsets.only(top: isHovered ? 35 : 60),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: logo,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                padding: const EdgeInsets.all(20.0),
                transform: Matrix4.translationValues(0, isHovered ? 0 : 40, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyText(
                      card['header']!,
                      softWrap: true,
                      size: 20,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10.0),
                    AnimatedOpacity(
                      opacity: isHovered ? 1 : 0,
                      duration: Durations.medium1,
                      child: Visibility(
                        visible: isHovered,
                        replacement: const SizedBox(height: 60),
                        child: MyText(card['content']!),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
