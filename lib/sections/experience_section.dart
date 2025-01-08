import 'package:aali_portfolio/components/date_chip.dart';
import 'package:aali_portfolio/components/section_header.dart';
import 'package:aali_portfolio/components/timeline_child.dart';
import 'package:aali_portfolio/components/timeline_indicator.dart';
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/data/my_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * (isDesktop(context) ? desktopPadding : (mobilePadding - 0.015)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SectionHeader(
            subtitle: 'WHAT I HAVE DONE SO FAR',
            title: 'Learning Journey',
            isCentered: true,
          ),
          const SizedBox(height: 35),
          ...List.generate(
            MyData.experience.length,
            (index) => TimelineTile(
              alignment: isDesktop(context) ? TimelineAlign.center : TimelineAlign.start,
              startChild: isDesktop(context) ? (index.isOdd ? TimelineChild(index) : AlignedDateChip(index)) : null,
              endChild: isDesktop(context)
                  ? (index.isEven ? TimelineChild(index) : AlignedDateChip(index))
                  : TimelineChild(index),
              afterLineStyle: LineStyle(
                thickness: 3,
                color: Theme.of(context).highlightColor,
              ),
              isLast: index == MyData.experience.length - 1,
              indicatorStyle: IndicatorStyle(
                indicatorXY: 0,
                color: Theme.of(context).colorScheme.primary,
                height: indicatorSize.height,
                width: indicatorSize.width,
                indicator: TimelineIndicator(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//* Aligning left or right based on index for desktop screens
class AlignedDateChip extends StatelessWidget {
  final int index;
  const AlignedDateChip(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: index.isEven ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: DateChip(experience: MyData.experience[index]),
      ),
    );
  }
}
