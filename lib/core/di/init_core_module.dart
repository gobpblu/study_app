import 'package:study_app/core/data/db/language_study_database.dart';
import 'package:study_app/core/di/dependency_injection.dart';

void initCoreModule() {

  getIt.registerSingleton(LanguageStudyDatabase());

}