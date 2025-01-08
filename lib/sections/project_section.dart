import 'package:aali_portfolio/components/custom_expansion_tile.dart';
import 'package:aali_portfolio/components/project_image.dart';
import 'package:aali_portfolio/components/section_header.dart';
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/constants/my_text.dart';
import 'package:aali_portfolio/data/my_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * (isDesktop(context) ? desktopPadding : mobilePadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionHeader(subtitle: 'MY WORK', title: 'PROJECTS', description: MyData.projectSectionIntro),
          const SizedBox(height: 30),
          SizedBox(
            width: double.maxFinite,
            child: Wrap(
              spacing: context.width * 0.05,
              runSpacing: isDesktop(context) ? 80 : 50,
              alignment: WrapAlignment.spaceEvenly,
              runAlignment: WrapAlignment.start,
              //* Project Card
              children: List.generate(MyData.projects.length, (index) {
                return LayoutBuilder(
                  builder: (context, constraints) => SizedBox(
                    width: isDesktop(context) ? 400 : context.width - (context.width * mobilePadding),
                    child: Material(
                      elevation: 10,
                      type: MaterialType.card,
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          //* Image
                          AnimatedContainer(
                            duration: Durations.medium1,
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            ),
                            child: ProjectImage(index: index),
                          ),
                          //* Project title and info
                          CustomExpansionTile(
                            title: MyText(
                              MyData.projects[index].title,
                              fontFamily: "Poppins",
                              weight: FontWeight.bold,
                              size: 20,
                            ),
                            subtitle: MyText(MyData.projects[index].subtitle, fontFamily: "Poppins"),
                            children: [
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, bottom: 5),
                                child: MyText(MyData.projects[index].description, fontFamily: "Poppins"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          //* White Space from next section
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
