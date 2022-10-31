import 'package:flutter/material.dart';

import 'sub_theme_data_mixin.dart';

const Color primaryLightColor = Color(0xFF3AC3CB);
const Color secondaryLightColor = Color(0xFFF85187);
const Color mainTextColor = Color.fromARGB(255, 40, 40, 40);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      backgroundColor: Colors.black87,
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
        bodyColor: mainTextColor,
        displayColor: mainTextColor,
      ),
    );
  }
}
