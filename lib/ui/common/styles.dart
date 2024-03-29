import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorPallete {
  const ColorPallete._();

  static const primaryColor = Color(0xFFFF8527);
  static const secondaryColor = Color(0xFF009EBA);
  static const accentColor = Color(0xFF003046);
  static const darkGray = Color(0xFF636773);
  static const lightGray = Color(0xFFb8b9ba);
  static const blueishGray = Color(0xFFF2F3F4);
  static final backgroundColor = Colors.white;

  static const numberSpinnerColor = Color(0xFFFFB945);

  static const infoColor = Color(0xFF0D6EFD);
  static const successColor = Color(0xFF00B894);
  static const warningColor = Color(0xFFFFC107);
  static const errorColor = Color(0xFFDC3545);

  static const textColor = accentColor;
}

final BoxDecoration kBorderedDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  border: Border.all(
    color: ColorPallete.lightGray.withOpacity(0.5),
  ),
);

final kTextTheme = TextTheme(
  headline1: GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: -1.5,
  ),
  headline2: GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
  ),
  headline3: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
  ),
  headline4: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 1,
  ),
  headline5: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  ),
  headline6: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 1,
    color: Colors.white,
  ),
  subtitle1: GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  subtitle2: GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
  ),
  bodyText1: GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyText2: GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  button: GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
  ),
  caption: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: ColorPallete.lightGray,
  ),
  overline: GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
);
