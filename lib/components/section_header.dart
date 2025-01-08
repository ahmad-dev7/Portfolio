import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/constants/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionHeader extends StatelessWidget {
  final String subtitle;
  final String title;
  final String? description;
  final bool? isCentered;
  const SectionHeader({
    super.key,
    required this.subtitle,
    required this.title,
    this.description,
    this.isCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isCentered! ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Opacity(opacity: .5, child: MyText(subtitle)),
        MyText(title, fontFamily: "Salsa", weight: FontWeight.bold, size: isDesktop(context) ? 60 : 30),
        if (description != null)
          SizedBox(
            width: context.width * (isDesktop(context) ? 0.4 : 1),
            child: MyText(description!, size: 18),
          ),
      ],
    );
  }
}
