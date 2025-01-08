import 'package:aali_portfolio/constants/collaborate_indicator.dart';
import 'package:aali_portfolio/constants/info_chip.dart';
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/constants/labeled_divider.dart';
import 'package:aali_portfolio/constants/my_text.dart';
import 'package:aali_portfolio/constants/view_detail_button.dart';
import 'package:aali_portfolio/data/my_data.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoCard extends StatelessWidget {
  final double horizontalPadding;
  const ContactInfoCard({super.key, required this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    Duration duration = Durations.medium4;
    double imageSize = 150;
    double expandedImageHeight = 200;
    double collapsedHeight = expandedImageHeight + 85; //* Height of expanded image + height of collapsed button row
    double profileCardWidth = isDesktop(context) ? 400 : (context.width - horizontalPadding);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* Title for this
        const Opacity(
          opacity: .9,
          child: MyText("Contact Details", weight: FontWeight.w200, size: 22, fontFamily: "Poppins"),
        ),
        const SizedBox(height: 20),
        Obx(
          () {
            //* assigning to short variable to use with ease
            var isHovered = ctrl.isProfileHovered.value;
            return MouseRegion(
              onEnter: (_) => ctrl.isProfileHovered.value = true,
              onExit: (_) => ctrl.isProfileHovered.value = false,
              child: AnimatedContainer(
                duration: duration,
                height: isHovered ? 600 : collapsedHeight,
                width: profileCardWidth,
                child: LayoutBuilder(
                  builder: (context, constraints) => Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      //* Info Container
                      AnimatedPositioned(
                        duration: duration,
                        top: isHovered ? imageSize / 2 : expandedImageHeight - 20,
                        left: 10,
                        right: 10,
                        child: AnimatedContainer(
                          duration: duration,
                          width: constraints.maxWidth,
                          height: isHovered ? constraints.maxHeight - 100 : 80,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x4E191D25),
                                blurRadius: 8,
                                spreadRadius: -2,
                                offset: Offset(0, 4),
                              ),
                              BoxShadow(
                                color: Color(0x1314161B),
                                blurRadius: 0,
                                spreadRadius: 1,
                                offset: Offset(0, 0),
                              ),
                            ],
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(isHovered ? imageSize / 2 : 20),
                              topRight: const Radius.circular(20),
                              bottomLeft: const Radius.circular(20),
                              bottomRight: Radius.circular(isHovered ? imageSize : 20),
                            ),
                          ),
                          child: SizedBox(height: isHovered ? 10 : 20),
                        ),
                      ),

                      //* Image Container
                      AnimatedContainer(
                        duration: duration,
                        width: isHovered ? imageSize : constraints.maxWidth,
                        height: isHovered ? imageSize : expandedImageHeight,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(isHovered ? imageSize : 12),
                        ),
                        child: AnimatedScale(
                          duration: duration,
                          scale: isHovered ? 1.18 : 1,
                          child: Image.asset("asset/image/resized.png", fit: BoxFit.cover),
                        ),
                      ),

                      //* To make effect like the info container is on top of the image when it is not hovered
                      AnimatedPositioned(
                        duration: duration,
                        top: expandedImageHeight - 20,
                        right: 10,
                        left: 10,
                        child: AnimatedContainer(
                          duration: duration,
                          width: isHovered ? 0 : constraints.maxWidth,
                          height: isHovered ? 0 : 21,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                        ),
                      ),

                      //* [View Details button] [Collaborate Indicator]
                      AnimatedPositioned(
                        duration: duration,
                        top: isHovered ? imageSize * 0.55 : expandedImageHeight - 3,
                        right: 20,
                        child: AnimatedContainer(
                          duration: duration,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.only(left: 10),
                          child: AnimatedSwitcher(
                            duration: duration,
                            child: isHovered
                                ? const CollaborateIndicator(key: Key("Collaborate"))
                                : ViewDetailButton(key: const Key("ViewDetail"), onTap: ctrl.isProfileHovered.toggle),
                          ),
                        ),
                      ),

                      //* [Social Button] [Personal Info & Languages]
                      AnimatedPositioned(
                        duration: duration,
                        top: isHovered ? imageSize + 10 : expandedImageHeight - 5,
                        left: isHovered ? 15 : 10,
                        // 135 is to eliminate width of the [Show Details] button
                        right: isHovered ? 15 : 135,
                        bottom: isHovered ? 10 : 0,
                        child: Column(
                          children: [
                            //* Social Button
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(
                                MyData.socialIcons.length,
                                (index) => IconButton.filled(
                                  onPressed: () => launchUrl(
                                    Uri.parse(MyData.socialLinks[index]),
                                    webOnlyWindowName: '_blank',
                                  ),
                                  style: ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(Colors.deepPurpleAccent.withOpacity(.2)),
                                    backgroundColor: MaterialStatePropertyAll(
                                      isHovered ? Theme.of(context).hoverColor : Colors.transparent,
                                    ),
                                  ),
                                  icon: SvgPicture.asset(MyData.socialIcons[index], height: 22),
                                ),
                              ),
                            ),

                            //* [Personal Info] and [Languages]
                            AnimatedContainer(
                              duration: duration,
                              height: isHovered ? 355 : 0,
                              child: FadeInDown(
                                animate: isHovered,
                                duration: duration,
                                child: AnimatedOpacity(
                                  duration: duration,
                                  opacity: isHovered ? 1 : 0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 15),
                                      const LabeledDivider(label: 'Personal Info'),
                                      const SizedBox(height: 10),
                                      const InfoChip(label: "aali.dev7@gmail.com", icon: Icons.email),
                                      const SizedBox(height: 10),
                                      const InfoChip(label: "Mumbai, India", icon: Icons.location_pin),
                                      const SizedBox(height: 10),
                                      const InfoChip(label: "GMT+5:30", icon: Icons.access_time),
                                      const SizedBox(height: 15),
                                      const LabeledDivider(label: 'Languages'),
                                      const SizedBox(height: 10),
                                      ...List.generate(
                                        MyData.languages.length,
                                        (index) => Padding(
                                          padding: EdgeInsets.only(
                                            bottom: index == MyData.languages.length - 1 ? 0 : 10,
                                          ),
                                          child: InfoChip(label: MyData.languages[index], icon: Icons.language),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //* Arrow to close expansion on mobile devices only
                      if (isHovered && !isDesktop(context))
                        Positioned(
                          bottom: 75,
                          right: 30,
                          //duration: duration,
                          child: InkWell(
                            onTap: () => ctrl.isProfileHovered.toggle(),
                            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                            child: FadeInDown(
                              duration: duration,
                              child: Container(
                                width: 60,
                                height: 30,
                                padding: const EdgeInsets.only(right: 10, bottom: 2),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).hoverColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(20),
                                    topRight: const Radius.circular(0),
                                    bottomRight: Radius.circular(imageSize),
                                  ),
                                ),
                                child: const Icon(Icons.expand_less),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
