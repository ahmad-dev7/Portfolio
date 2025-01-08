import 'package:aali_portfolio/constants/my_text.dart';
import 'package:aali_portfolio/data/my_data.dart';
import 'package:flutter/material.dart';

class ProjectInfo extends StatelessWidget {
  final int index;
  const ProjectInfo({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Project title
          MyText(
            MyData.projects[index].title,
            size: 20,
            weight: FontWeight.w700,
            fontFamily: "Poppins",
          ),
          const SizedBox(height: 8),
          //* Project Description
          Opacity(
            opacity: 0.8,
            child: MyText(MyData.projects[index].description, fontFamily: "Poppins"),
          ),
        ],
      ),
    );
  }
}
