import 'package:aali_portfolio/controller/my_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// To access controller directly from anywhere, it will be initialized in main function before app runs
late MyController ctrl;

// Mobile horizontal padding: This padding is used to leave white-space horizontally between the content and the edges of the screen
// This value will be used as multiplier with the screen size //![context.width * mobilePadding]
double mobilePadding = 0.05;

// Desktop horizontal padding: This padding is used to leave white-space horizontally between the content and the edges of the screen
// This value will be used as multiplier with the screen size //![context.width * mobilePadding]
double desktopPadding = 0.15;

// [Skills] Carousel height
double carouselHeight = 350;

// Timeline Indicator height and width
Size indicatorSize = const Size(50, 50);

// Returns true if the current device is desktop based on width
bool isDesktop(context) {
  return ResponsiveBreakpoints.of(context).isDesktop;
}

void scrollToSection(GlobalKey key) {
  final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
  if (renderBox != null) {
    final offset = renderBox.localToGlobal(Offset.zero);
    ctrl.scrollCtrl.animateTo(
      (offset.dy + ctrl.scrollCtrl.offset) - (kTextTabBarHeight + 10),
      duration: Durations.long1,
      curve: Curves.easeIn,
    );
  }
}

GlobalKey aboutSectionKey = GlobalKey();
GlobalKey skillsSectionKey = GlobalKey();
GlobalKey experienceSectionKey = GlobalKey();
GlobalKey projectsSectionKey = GlobalKey();
GlobalKey contactSectionKey = GlobalKey();

// Form submit button states
var submitState = 'submit';
var loadingState = 'loading';
var successState = 'success';
var errorState = 'error';
