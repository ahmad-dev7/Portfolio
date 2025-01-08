import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final double? width;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final bool? softWrap;
  final TextDirection? textDirection;
  const MyText(this.text,
      {super.key,
      this.color,
      this.size = 15,
      this.weight = FontWeight.w400,
      this.textAlign,
      this.maxLines,
      this.overflow = TextOverflow.visible,
      this.height,
      this.width,
      this.fontFamily = "Roboto",
      this.letterSpacing,
      this.wordSpacing,
      this.softWrap,
      this.textDirection});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: softWrap ?? true,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      textScaler: TextScaler.noScaling,
      style: GoogleFonts.getFont(
        fontFamily!,
        textStyle: TextStyle(
          color: color,
          fontSize: size,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          height: height,
          overflow: overflow,
          fontWeight: weight,
        ),
      ),
    );
  }
}
