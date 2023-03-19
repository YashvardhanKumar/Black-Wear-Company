import 'package:flutter/material.dart';

class CustomText extends Text {
  const CustomText(
    this.text, {
    super.key,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.height,
    this.overflow,
    this.maxLines,
    this.textAlign,
  }) : super(text);
  final FontWeight? fontWeight;
  final double? fontSize, height;
  final Color? color;
  final String text;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        height: height,
        color: color,
        fontFamily: 'Poppins',
      ),
    );
  }
}
