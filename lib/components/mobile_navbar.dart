import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/constants/my_text.dart';
import 'package:aali_portfolio/controller/my_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileNavbar extends StatelessWidget {
  const MobileNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    var animationController = Get.put(MyAnimationController());
    return AppBar(
      centerTitle: false,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.only(left: context.width * mobilePadding),
        child: const MyText("Ahmad's Portfolio", size: 20, weight: FontWeight.w600),
      ),
      actions: [
        PopupMenuButton(
          onOpened: () => animationController.animatedMenuIconController.forward(),
          onCanceled: () => animationController.animatedMenuIconController.reverse(),
          position: PopupMenuPosition.under,
          color: Theme.of(context).cardColor,
          itemBuilder: (_) => [
            PopupMenuItem(
              child: const MyText("About"),
              onTap: () => scrollToSection(aboutSectionKey),
            ),
            PopupMenuItem(
              child: const MyText("Skills"),
              onTap: () => scrollToSection(skillsSectionKey),
            ),
            PopupMenuItem(
              child: const MyText("Experience"),
              onTap: () => scrollToSection(experienceSectionKey),
            ),
            PopupMenuItem(
              child: const MyText("Projects"),
              onTap: () => scrollToSection(projectsSectionKey),
            ),
            PopupMenuItem(
              child: const MyText("Contact"),
              onTap: () => scrollToSection(contactSectionKey),
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: animationController.animatedMenuIconController,
            ),
          ),
        ),
        SizedBox(width: context.width * mobilePadding),
      ],
    );
  }
}
