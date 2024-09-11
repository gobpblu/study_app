import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/words/models/word.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/collect_listened_word/presentation/bloc/collect_listened_word_cubit.dart';

void initCollectListenedWordModule() {

  getIt.registerFactoryParam((List<Word> param1, param2) => CollectListenedWordCubit(param1));

}