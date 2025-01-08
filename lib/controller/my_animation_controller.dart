import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAnimationController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animatedMenuIconController;
  @override
  void onInit() {
    animatedMenuIconController = AnimationController(
      vsync: this,
      duration: Durations.long2,
    );
    super.onInit();
  }
}
