import 'package:flutter/material.dart';
import 'package:study_app/core/res/styles/text_styles.dart';
import 'package:study_app/core/themes/sub_theme_data_mixin.dart';

// const Color primaryDarkColor = Color(0xFF2E3C90);
const Color primaryDarkColor = Color(0xFF262938);
const Color onPrimaryDarkColor = Color(0xFF1f2233);
// const Color secondaryDarkColor = Colors.white38;
const Color secondaryDarkColor = Color(0xFFaa8af9);

class DarkTheme with SubThemeData {
  buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      backgroundColor: primaryDarkColor,
      iconTheme: getIconTheme(),
      textTheme: getTextTheme(),
      primaryColor: primaryDarkColor,
      appBarTheme: buildDarkAppBar(getAppBarTheme()),
      dividerColor: Colors.transparent,
      elevatedButtonTheme: getElevatedButtonTheme(),
      bottomNavigationBarTheme: getBottomNavigationBarTheme(),
    );
  }

  AppBarTheme buildDarkAppBar(AppBarTheme appBarTheme) => appBarTheme.copyWith(
        color: primaryDarkColor,
        // backgroundColor: primaryDarkColor,
        toolbarTextStyle: appBarContentTextStyle,
      );
}
