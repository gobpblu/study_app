import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/words/models/word.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/collect_word/presentation/bloc/collect_word_cubit.dart';

void initCollectWordModule() {
  getIt.registerFactoryParam((List<Word> param1, param2) => CollectWordCubit(param1));
}
