import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/controller/my_controller.dart';
import 'package:aali_portfolio/home_page.dart';
import 'package:aali_portfolio/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  // ctrl variable is created in k_constants function to grant access globally
  ctrl = Get.put(MyController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        home: const HomePage(),
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: ctrl.isDark.value ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        // scrollBehavior: const ScrollBehavior().copyWith(
        //   scrollbars: false,
        //   dragDevices: {
        //     PointerDeviceKind.mouse,
        //     PointerDeviceKind.touch,
        //     PointerDeviceKind.trackpad,
        //   },
        // ),
        builder: (context, child) => ResponsiveBreakpoints(
          breakpoints: const [
            Breakpoint(start: 0, end: 600, name: MOBILE),
            Breakpoint(start: 601, end: 1920, name: DESKTOP),
          ],
          child: child!,
        ),
      ),
    );
  }
}
