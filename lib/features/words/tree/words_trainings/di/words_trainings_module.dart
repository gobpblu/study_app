import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/words/tree/words_trainings/bloc/words_trainings_cubit.dart';
import 'package:study_app/features/words/tree/words_trainings/data/repository/words_trainings_repository_impl.dart';
import 'package:study_app/features/words/tree/words_trainings/domain/repository/words_training_repository.dart';

void initWordsTrainingsModule() {

  getIt.registerLazySingleton<WordsTrainingsRepository>(() => WordsTrainingsRepositoryImpl(dbService: getIt(), audioStorage: getIt(), ratingsHive: getIt(), realtimeDatabaseService: getIt()));
  getIt.registerFactory(() => WordsTrainingsCubit(wordsRepository: getIt()));

}