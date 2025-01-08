import 'package:aali_portfolio/components/section_header.dart';
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/constants/mobile_skills_carousel.dart';
import 'package:aali_portfolio/effect/transforming_card.dart';
import 'package:aali_portfolio/data/my_data.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var horizontalPadding = context.width * (isDesktop(context) ? desktopPadding : mobilePadding);
    return AnimatedContainer(
      duration: Durations.long1,
      width: context.width - (horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const SectionHeader(
              subtitle: "INTRODUCTION",
              title: "Overview",
              description: MyData.skillSectionIntro,
            ),
          ),
          const SizedBox(height: 25),
          //! On the desktop devices skills card will be shown as normal cards in [wrap]
          if (isDesktop(context))
            Padding(
              padding: EdgeInsets.only(left: horizontalPadding, top: 30, bottom: 30),
              child: SizedBox(
                width: double.maxFinite,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 60,
                  spacing: 10,
                  children: List.generate(
                    MyData.skills.length,
                    (index) => FadeInLeft(
                      from: 200 * (index + 1),
                      child: AnimatedTransformingCard(
                        height: carouselHeight - 50,
                        width: 230,
                        card: {"header": MyData.skills[index].title, "content": MyData.skills[index].info},
                        logo: SvgPicture.asset(MyData.skills[index].logoUrl, height: 100, width: 100),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          //! On mobile devices skills card be shown as carousel view for easy navigation
          if (!isDesktop(context)) const MobileSkillsCarousel(),
          //* white space from next section
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
