import 'package:aali_portfolio/components/nav_button.dart';
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/constants/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      toolbarHeight: kToolbarHeight + 15,
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: EdgeInsets.only(left: context.width * (desktopPadding - 0.05)),
        child: const MyText("Ahmad's Portfolio", size: 25, weight: FontWeight.w600),
      ),
      actions: [
        NavButton('About', onTap: () => scrollToSection(aboutSectionKey)),
        NavButton('Skills', onTap: () => scrollToSection(skillsSectionKey)),
        NavButton('Experience', onTap: () => scrollToSection(experienceSectionKey)),
        NavButton('Projects', onTap: () => scrollToSection(projectsSectionKey)),
        NavButton('Contact', onTap: () => scrollToSection(contactSectionKey)),
        // const SizedBox(width: 15),
        // MySwitch(onChange: (_) => ctrl.isDark.toggle()),
        SizedBox(width: context.width * (desktopPadding - 0.05))
      ],
    );
  }
}
