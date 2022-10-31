import 'package:flutter/material.dart';
import 'package:study_app/core/res/styles/text_styles.dart';
import 'package:study_app/core/themes/sub_theme_data_mixin.dart';

const Color primaryDarkColor = Color(0xFF2E3C90);
const Color secondaryDarkColor = Colors.white38;

class DarkTheme with SubThemeData {
  buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        backgroundColor: Colors.black87,
        iconTheme: getIconTheme(),
        textTheme: getTextTheme(),
        primaryColor: Colors.white,
        appBarTheme: buildDarkAppBar(getAppBarTheme()),
    );
  }

  AppBarTheme buildDarkAppBar(AppBarTheme appBarTheme) =>
      appBarTheme.copyWith(
        color: secondaryDarkColor,
        // backgroundColor: primaryDarkColor,
        toolbarTextStyle: appBarContentTextStyle,
        titleTextStyle: appBarTitleTextStyle,
        iconTheme: const IconThemeData(color: Colors.black87),
      );
}