import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom Text widget with bold style.
class TextBoldW700 extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final TextAlign? textAlign;
  final bool? isUnderLine;

  const TextBoldW700({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    this.textAlign,
    this.isUnderLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: textColor,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        decoration: isUnderLine != null && isUnderLine!
            ? TextDecoration.underline
            : TextDecoration.none,
      ),
      textDirection: TextDirection.ltr,
      textAlign: textAlign,
    );
  }
}

class TextExtraBoldW800 extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final bool isUnderLine;
  final TextAlign? textAlign;

  const TextExtraBoldW800({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.isUnderLine,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: textColor,
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
        decoration:
            isUnderLine ? TextDecoration.underline : TextDecoration.none,
      ),
      textDirection: TextDirection.ltr,
      textAlign: textAlign,
    );
  }
}

// Custom Text widget with medium style.
class TextMediumW500 extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final bool isUnderLine;
  final TextAlign? textAlign;
  final bool wantOverFlowEllipsis;

  const TextMediumW500({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.isUnderLine,
    required this.wantOverFlowEllipsis,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        decoration:
            isUnderLine ? TextDecoration.underline : TextDecoration.none,
      ),
      textDirection: TextDirection.ltr,
      textAlign: textAlign,
    );
  }
}

class TextSmallW300 extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final bool isUnderLine;
  final TextAlign? textAlign;

  const TextSmallW300({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.isUnderLine,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: textColor,
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
        decoration:
            isUnderLine ? TextDecoration.underline : TextDecoration.none,
      ),
      textDirection: TextDirection.ltr,
      textAlign: textAlign,
    );
  }
}

// Custom Text widget with normal style.
class TextNormalW400 extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final TextAlign? textAlign;
  final bool? wantOverFlowEllipsis;

  const TextNormalW400({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    this.textAlign,
    this.wantOverFlowEllipsis = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: textColor,
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        decoration: TextDecoration.none,
      ),
      textDirection: TextDirection.ltr,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

// Custom Text widget with semi-bold style.
class TextSemiBoldW600 extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final bool isUnderLine;
  final TextAlign? textAlign;

  const TextSemiBoldW600({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.isUnderLine,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: textColor,
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        decoration:
            isUnderLine ? TextDecoration.underline : TextDecoration.none,
      ),
      textDirection: TextDirection.ltr,
      textAlign: textAlign,
    );
  }
}
