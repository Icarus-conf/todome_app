import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoppinsText extends StatelessWidget {
  final String text;
  final double? fontS;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final double? letterSpacing;
  final TextDecoration? textDecoration;

  const PoppinsText({
    super.key,
    required this.text,
    this.fontS,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.letterSpacing,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontS,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
        decorationColor: Colors.black,
        decorationThickness: 2,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
