import 'package:excess_edu/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:excess_edu/consts/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primarySwatch,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primarySwatch,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}
