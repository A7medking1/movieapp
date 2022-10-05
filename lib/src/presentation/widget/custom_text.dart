import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? letterSpacing;

  const CustomText({super.key,
    required this.text,
    this.style,
    this.overflow,
    this.maxLines,
    this.color,
    this.letterSpacing,
    this.fontFamily,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ??
          TextStyle(
            letterSpacing: letterSpacing,
            color: color ?? Colors.white,
            fontFamily: fontFamily,
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
