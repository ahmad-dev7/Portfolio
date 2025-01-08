import 'package:aali_portfolio/constants/fade_border.dart';
import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/constants/my_text.dart';
import 'package:aali_portfolio/data/my_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MobileSkillsCarousel extends StatelessWidget {
  const MobileSkillsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: carouselHeight,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Obx(
              () => CarouselSlider(
                items: List.generate(
                  MyData.skills.length,
                  (index) => AnimatedContainer(
                    duration: Durations.medium1,
                    height: carouselHeight - 50,
                    margin: EdgeInsets.symmetric(horizontal: context.width * mobilePadding),
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3D000000),
                            blurRadius: 8,
                            spreadRadius: -2,
                            offset: Offset(0, 4),
                          ),
                          BoxShadow(
                            color: Color(0x2B000000),
                            blurRadius: 5,
                            spreadRadius: -10,
                            offset: Offset(0, 0),
                          ),
                        ]),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        AnimatedContainer(
                          duration: Durations.medium1,
                          height: ctrl.activeIndex.value == index ? 100 : 40,
                          child: SvgPicture.asset(MyData.skills[index].logoUrl),
                        ),
                        const SizedBox(height: 45),
                        Center(child: MyText(MyData.skills[index].title, size: 18, weight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyText(MyData.skills[index].info, textAlign: TextAlign.center),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                carouselController: ctrl.carouselCtrl,
                options: CarouselOptions(
                  height: carouselHeight,
                  initialPage: ctrl.activeIndex.value,
                  enlargeFactor: 0.6,
                  aspectRatio: 9 / 16,
                  viewportFraction: 0.7,
                  autoPlay: ctrl.autoPlayCarousel.value,
                  pageSnapping: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  onPageChanged: (index, reason) => ctrl.activeIndex.value = index,
                ),
              ),
            ),
          ),

          //! This makes the carousel edge faded so it doesn't feel like directly cropped
          //* From Left
          const FadeBorder(begin: Alignment.centerLeft, end: Alignment.centerRight),
          //* From Right
          const FadeBorder(begin: Alignment.centerRight, end: Alignment.centerLeft),
        ],
      ),
    );
  }
}
