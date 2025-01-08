import 'package:aali_portfolio/components/theme_switch.dart';
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointedDivider extends StatelessWidget {
  const PointedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // The height given to the line [+] the height of the circle on top of it
      height: (context.height * (isDesktop(context) ? 0.7 : 0.5)) + 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MySwitch(onChange: (_) => ctrl.isDark.toggle()),
          // Container(
          //   width: 20,
          //   height: 20,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: Theme.of(context).colorScheme.primary,
          //   ),
          // ),
          Container(
            width: 2,
            height: context.height * (isDesktop(context) ? 0.7 : 0.5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).scaffoldBackgroundColor,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
