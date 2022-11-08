import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_app/core/res/fonts.dart';

import '../res/app_colors.dart';
import '../res/text_styles.dart';

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
    return const IconThemeData(color: primaryTextColor, size: 16);
  }

  ElevatedButtonThemeData getElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white38),
        splashFactory: InkRipple.splashFactory,
      )
    );
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
      actionsIconTheme: IconThemeData(
        color: primaryTextColor,
      )
    );
  }

  BottomNavigationBarThemeData getBottomNavigationBarTheme() {
   return const BottomNavigationBarThemeData(
     unselectedLabelStyle: bottomBarUnselectedTextStyle,
     selectedLabelStyle: bottomBarSelectedTextStyle,
     elevation: 0,
     type: BottomNavigationBarType.fixed,
     selectedItemColor: selectedBottomBarItemColor,
     unselectedItemColor: unselectedBottomBarItemColor,
     showUnselectedLabels: true,
     landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
   );
  }
}
