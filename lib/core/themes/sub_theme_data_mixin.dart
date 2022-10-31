import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_app/core/res/fonts.dart';

import '../res/app_colors.dart';

mixin SubThemeData {
  TextTheme getTextTheme() {
    return GoogleFonts.quicksandTextTheme(const TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        )));
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(color: onSurfaceTextColor, size: 16);
  }

  AppBarTheme getAppBarTheme() {
    return const AppBarTheme(
      elevation: 0,
      toolbarHeight: 48,
      toolbarTextStyle: TextStyle(
        fontFamily: fontBreeSerif,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
