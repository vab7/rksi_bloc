import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rksi_bloc/resources/color/color.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: primary,
    ),
    colorScheme: const ColorScheme.light(),
    textTheme: GoogleFonts.robotoTextTheme(),
    primaryColor: black,
  );

  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: primary,
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
    colorScheme: const ColorScheme.dark(),
    primaryColor: white,
  );
}
