import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySwitch extends StatelessWidget {
  final ValueChanged<bool> onChange;
  const MySwitch({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: isDesktop(context) ? 1 : 0.8,
      child: SizedBox(
        height: 20,
        width: 30,
        child: Obx(
          () => Switch(
            value: !ctrl.isDark.value,
            onChanged: onChange,
            activeTrackColor: Colors.transparent,
            activeColor: ThemeData.dark().scaffoldBackgroundColor,
            inactiveTrackColor: Colors.transparent,
            inactiveThumbColor: Colors.amber,
            trackOutlineColor: MaterialStatePropertyAll(
              ctrl.isDark.value ? Colors.white24 : Colors.black26,
            ),
            thumbIcon: MaterialStatePropertyAll(
              Icon(
                ctrl.isDark.value ? Icons.sunny : Icons.brightness_2,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
