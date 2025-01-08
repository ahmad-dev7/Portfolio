import 'package:aali_portfolio/constants/my_text.dart';
import 'package:flutter/material.dart';

class LabeledDivider extends StatelessWidget {
  final String label;
  const LabeledDivider({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        const SizedBox(width: 5),
        Opacity(opacity: .5, child: MyText(label)),
        const SizedBox(width: 5),
        const Expanded(child: Divider()),
      ],
    );
  }
}
