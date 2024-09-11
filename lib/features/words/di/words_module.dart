import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/words/bloc/words_bloc.dart';
import 'package:study_app/features/words/repository/words_repository_impl.dart';

void initWordsModule() {
  getIt.registerLazySingleton(() => WordsRepositoryImpl(audioStorage: getIt(), dbService: getIt(), realtimeDatabaseService: getIt()));
  getIt.registerFactory(() => WordsBloc(wordsRepository: getIt()));
}
