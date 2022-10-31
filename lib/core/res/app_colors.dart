import 'package:flutter/material.dart';
import 'package:study_app/core/themes/light_theme.dart';

import '../themes/dark_theme.dart';
import '../themes/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white70;

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColor, secondaryLightColor]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColor, secondaryDarkColor]);

LinearGradient mainGradient(BuildContext context) =>
    UiParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;
