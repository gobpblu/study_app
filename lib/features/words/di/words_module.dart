import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/words/bloc/words_bloc.dart';
import 'package:study_app/features/words/repository/words_repository_impl.dart';
import 'package:study_app/features/words/tree/words_trainings/bloc/words_trainings_cubit.dart';

void initWordsModule() {
  getIt.registerLazySingleton(() => WordsRepositoryImpl(audioStorage: getIt(), dbService: getIt(), realtimeDatabaseService: getIt()));
  getIt.registerFactory(() => WordsBloc(wordsRepository: getIt()));
  getIt.registerFactoryParam((String param1, String param2) =>
      WordsTrainingsCubit(topic: param1, jsonAsset: param2, wordsRepository: getIt()));
}
