import 'package:aali_portfolio/components/globe_of_logos.dart';
import 'package:aali_portfolio/components/heading_intro.dart';
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/constants/pointed_divider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width * (isDesktop(context) ? desktopPadding : mobilePadding)),
      width: context.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //* Pointed divider
          const PointedDivider(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //* [Greet & Name] [Quick info]
                const HeadingIntro(),
                //* Globe of icons of skills i acquire
                ZoomIn(
                  // This delay is to complete the animation of the about section
                  delay: Durations.medium1,
                  child: Center(
                    child: Material(
                      elevation: 1,
                      color: Colors.transparent,
                      shadowColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(ctrl.isDark.value ? .05 : .01),
                      borderRadius: BorderRadius.circular(context.height),
                      child: const GlobeOfLogos(),
                    ),
                  ),
                ),
                //* White space from next section
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ModifiedAboutSection extends StatelessWidget {
  const ModifiedAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width * (isDesktop(context) ? desktopPadding : mobilePadding)),
      width: context.width,
      child: Stack(
        children: [
          //* Pointed Divider with theme Switcher
          Padding(
            padding: EdgeInsets.only(top: isDesktop(context) ? 20 : 10),
            child: const PointedDivider(),
          ),
          //* Heading Intro
          Padding(
            padding: EdgeInsets.only(left: isDesktop(context) ? 50 : 40),
            child: const HeadingIntro(),
          ),
          //* Globe of Widget
          Padding(
            padding: EdgeInsets.only(top: isDesktop(context) ? 190 : 110, left: isDesktop(context) ? 50 : 10),
            child: ZoomIn(
              // This delay is to complete the animation of the about section
              delay: Durations.medium1,
              child: Center(
                child: Material(
                  elevation: 1,
                  color: Colors.transparent,
                  shadowColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(ctrl.isDark.value ? .05 : .01),
                  borderRadius: BorderRadius.circular(context.height),
                  child: const GlobeOfLogos(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
