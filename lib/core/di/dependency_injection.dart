import 'package:get_it/get_it.dart';
import 'package:study_app/core/di/init_core_module.dart';
import 'package:study_app/features/audios/di/audios_module.dart';
import 'package:study_app/features/realtime_database/service/realtime_database_service.dart';
import 'package:study_app/features/words/di/words_module.dart';

final getIt = GetIt.instance;

void initDependencyInjection() {
  getIt.registerSingleton(RealtimeDatabaseService());

  initCoreModule();

  initAudiosModule();

  initWordsModule();
}