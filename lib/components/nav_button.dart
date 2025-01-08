import 'package:aali_portfolio/constants/my_text.dart';
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? margin;
  const NavButton(this.text, {super.key, required this.onTap, this.margin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(margin ?? 12),
      child: ElevatedButton(onPressed: onTap, child: MyText(text, size: 18, weight: FontWeight.bold)),
    );
  }
}
