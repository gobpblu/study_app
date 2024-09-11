import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/words/models/word_with_points.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/training_success/data/repository/training_success_repository_impl.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/training_success/domain/repository/training_success_repository.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/training_success/presentation/bloc/training_success_cubit.dart';

void initTrainingSuccessModule() {
  getIt.registerLazySingleton<TrainingSuccessRepository>(
    () => TrainingSuccessRepositoryImpl(userRepository: getIt(), db: getIt(), ratingsHive: getIt()),
  );

  getIt.registerFactoryParam(
    (List<WordWithPoints> param1, param2) => TrainingSuccessCubit(words: param1, repository: getIt()),
  );
}
