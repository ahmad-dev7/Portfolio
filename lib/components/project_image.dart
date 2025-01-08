import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/data/my_data.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectImage extends StatelessWidget {
  final int index;
  const ProjectImage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedScale(
        scale: ctrl.hoveredProject.value == index ? 1.08 : 1.052,
        duration: Durations.medium1,
        child: InkWell(
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          onTap: () => showImageViewer(
            context,
            AssetImage(MyData.projects[index].image),
            swipeDismissible: true,
            doubleTapZoomable: true,
          ),
          onHover: (_) => _ ? ctrl.hoveredProject.value = index : ctrl.hoveredProject.value = -1,
          child: Image.asset(
            MyData.projects[index].image,
            height: 250,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
