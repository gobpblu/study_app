import 'package:flutter/material.dart';
import 'package:study_app/core/themes/light_theme.dart';

import '../themes/dark_theme.dart';
import '../themes/ui_parameters.dart';

const Color primaryColor = Color(0xFF262938);
const Color onPrimaryColor = Color(0xFF1f2233);
const Color secondaryColor = Color(0xFFaa8af9);
const Color onSurfaceTextColor = Colors.white70;
const Color secondaryTextColor = Color(0xFF52547a);
const Color primaryTextColor = Color(0xFFf6f9fb);
const Color progressIndicatorColor = Color(0xFF272a3b);
const Color cardBackgroundColor = Color(0xFF30323f);
const Color enterWordsBackgroundColor = Color(0xFF2e2c42);

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

const unselectedBottomBarItemColor = Colors.grey;
const selectedBottomBarItemColor =  Colors.white;