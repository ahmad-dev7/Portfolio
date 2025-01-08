import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:flutter/material.dart';

// This makes the carousel edge faded so it doesn't feel like directly cropped
class FadeBorder extends StatelessWidget {
  final Alignment begin;
  final Alignment end;
  const FadeBorder({super.key, required this.begin, required this.end});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: begin,
      child: Container(
        height: carouselHeight,
        width: isDesktop(context) ? 100 : 30,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.6),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.3),
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.0001),
            ],
          ),
        ),
      ),
    );
  }
}
