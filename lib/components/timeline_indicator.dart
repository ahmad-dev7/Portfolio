import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/data/my_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TimelineIndicator extends StatelessWidget {
  final int index;
  const TimelineIndicator(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: indicatorSize.height,
      width: indicatorSize.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).cardColor,
        border: Border.all(width: 1, color: Colors.blueGrey),
        boxShadow: const [
          BoxShadow(color: Color(0x1B000000), blurRadius: 20, spreadRadius: -20, offset: Offset(0, 19)),
          BoxShadow(color: Color(0x2E000000), blurRadius: 12, spreadRadius: 0, offset: Offset(0, 15)),
        ],
      ),
      child: SvgPicture.asset(
        MyData.experience[index].indicatorIcon,
        height: indicatorSize.height,
      ),
    );
  }
}
