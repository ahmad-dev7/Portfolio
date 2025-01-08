import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:aali_portfolio/constants/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingIntro extends StatelessWidget {
  const HeadingIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Wrap(
        direction: Axis.vertical,
        children: [
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: "Hi, I'm "),
                TextSpan(
                  text: "Ahmad",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    overflow: TextOverflow.visible,
                  ),
                )
              ],
              style: GoogleFonts.getFont(
                "Salsa",
                color: Theme.of(context).colorScheme.onBackground.withOpacity(.9),
                textStyle: TextStyle(
                  fontSize: isDesktop(context) ? 80 : 35,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: isDesktop(context) ? null : context.width * .8,
            child: Opacity(
              opacity: 0.8,
              child: MyText(
                //? {\n} is used only for big screen and not for small screen as lines would be automatically broken in multiple lines from any point
                "I develop cross-platform Mobile Applications,${isDesktop(context) ? "\n" : ""}Web Application and User interfaces...",
                size: isDesktop(context) ? 22 : 14,
                //maxLines: 5,
                fontFamily: "Poppins",
                textAlign: TextAlign.left,
                weight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
