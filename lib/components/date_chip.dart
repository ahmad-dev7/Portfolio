import 'package:aali_portfolio/constants/my_text.dart';
import 'package:aali_portfolio/data/experience_model.dart';
import 'package:flutter/material.dart';

class DateChip extends StatelessWidget {
  final ExperienceModel experience;
  const DateChip({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Opacity(
        opacity: 0.7,
        child: Chip(
          side: BorderSide.none,
          avatar: Icon(Icons.date_range, color: Theme.of(context).hintColor),
          label: MyText(experience.timePeriod, size: 14),
          visualDensity: VisualDensity.compact,
          labelPadding: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.all(0),
        ),
      ),
    );
  }
}
