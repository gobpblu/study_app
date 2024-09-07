import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/auth/service/auth_service.dart';

import 'core/themes/dark_theme.dart';
import 'core/translations/strings.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initDependencyInjection();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(GetMaterialApp(
    translations: Strings(),
    locale: Get.deviceLocale,
    fallbackLocale: const Locale('en'),
    debugShowCheckedModeBanner: false,
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: AuthService().handleAuthState(),
    theme: DarkTheme().buildDarkTheme(),
  ));
}
