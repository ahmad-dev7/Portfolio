import 'package:aali_portfolio/components/date_chip.dart';
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/constants/my_text.dart';
import 'package:aali_portfolio/data/my_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimelineChild extends StatelessWidget {
  final int index;
  const TimelineChild(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    var experience = MyData.experience[index];
    var isMobile = !isDesktop(context);
    var isOdd = index.isOdd;
    // Margin factor for desktop
    var marginFactor = context.width * 0.06;
    var desktopMargin = EdgeInsets.fromLTRB(isOdd ? marginFactor : 15, 0, !isOdd ? marginFactor : 15, 100);
    var mobileMargin = const EdgeInsets.fromLTRB(10, 0, 0, 60);
    // ignore: unnecessary_new
    var expansionController = new ExpansionTileController();

    return Container(
      margin: isMobile ? mobileMargin : desktopMargin,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Color(0x2F000000), offset: Offset(0, 4), blurRadius: 12, spreadRadius: 0),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Heading title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SizedBox(
              width: double.maxFinite,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  MyText(experience.title,
                      size: isMobile ? 18 : 20,
                      weight: isMobile ? FontWeight.w600 : FontWeight.w700,
                      fontFamily: "Poppins"),
                  if (isMobile) DateChip(experience: experience),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          ExpansionTile(
            key: UniqueKey(),
            //* To remove divider from top and bottom
            shape: const Border(),
            //* To adjust height of title
            subtitle: const SizedBox(),
            initiallyExpanded: isDesktop(context),
            title: Opacity(opacity: .85, child: MyText(experience.source, size: isDesktop(context) ? 15 : 14.5)),
            collapsedBackgroundColor: Theme.of(context).hoverColor,
            backgroundColor: Theme.of(context).hoverColor,
            controller: expansionController,
            children: [
              const Divider(),
              ...List.generate(
                experience.points.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: isMobile ? 8 : 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Opacity(opacity: 0.6, child: Icon(Icons.check_box)),
                      SizedBox(width: isDesktop(context) ? 15 : 10),
                      Flexible(
                        child: Opacity(
                          opacity: 0.8,
                          child: MyText(
                            experience.points[index],
                            fontFamily: "Poppins",
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
