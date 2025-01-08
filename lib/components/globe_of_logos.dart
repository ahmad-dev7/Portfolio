import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/data/my_data.dart';
import 'package:aali_portfolio/effect/widget_globe.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GlobeOfLogos extends StatelessWidget {
  const GlobeOfLogos({super.key});

  @override
  Widget build(BuildContext context) {
    var desktopRadius = context.height * 0.32;
    var mobileRadius = context.width / 2.2;
    return Obx(
      // For inner glow effect
      () => ZoomIn(
        child: Container(
          width: isDesktop(context) ? (desktopRadius * 2) : (mobileRadius * 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ctrl.isDark.value ? Colors.white10 : Colors.amberAccent.withOpacity(.15),
                blurRadius: 100,
                spreadRadius: -70,
                offset: const Offset(10, 0),
              ),
            ],
          ),
          child: isDesktop(context)
              ? Center(
                  child: GlobeOfWidgets(
                    key: const Key("For Desktop"),
                    itemSize: const Size(35, 35),
                    radius: desktopRadius,
                    widgets: List.generate(
                      MyData.logos.length,
                      (index) => SvgPicture.asset(
                        key: Key(MyData.logos[index]),
                        MyData.logos[index],
                        height: 35,
                        width: 35,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.topLeft,
                  child: GlobeOfWidgets(
                    key: const Key("For Mobile"),
                    itemSize: const Size(25, 25),
                    radius: mobileRadius,
                    widgets: List.generate(
                      MyData.logos.length,
                      (index) => SvgPicture.asset(
                        MyData.logos[index],
                        height: 25,
                        width: 25,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
