import 'package:get_it/get_it.dart';
import 'package:study_app/core/di/init_core_module.dart';
import 'package:study_app/features/audios/di/audios_module.dart';
import 'package:study_app/features/auth/di/auth_module.dart';
import 'package:study_app/features/auth/tree/login_and_password/di/login_and_password_module.dart';
import 'package:study_app/features/languages/di/languages_module.dart';
import 'package:study_app/features/profile/di/profile_module.dart';
import 'package:study_app/features/ratings/di/ratings_module.dart';
import 'package:study_app/features/realtime_database/service/realtime_database_service.dart';
import 'package:study_app/features/splash/di/splash_module.dart';
import 'package:study_app/features/words/di/words_module.dart';
import 'package:study_app/features/words/tree/words_trainings/di/words_trainings_module.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/choose_translation/di/choose_translation_module.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/collect_listened_word/di/collect_listened_word_module.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/collect_word/di/collect_word_module.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/training_success/di/training_success_module.dart';

final getIt = GetIt.instance;

void initDependencyInjection() {
  initCoreModule();
  initAuthModule();

  getIt.registerLazySingleton(() => RealtimeDatabaseService(userRepository: getIt()));

  initSplashModule();

  initLoginAndPasswordModule();

  initProfileModule();

  initAudiosModule();

  initWordsModule();

  initRatingsModule();

  initWordsTrainingsModule();

  initChooseTranslationModule();

  initCollectListenedWordModule();

  initCollectWordModule();

  initTrainingSuccessModule();

  initLanguagesModule();
}
