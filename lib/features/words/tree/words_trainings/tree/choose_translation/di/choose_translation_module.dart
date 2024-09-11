import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/words/models/word.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/choose_translation/presentation/bloc/choose_translation_cubit.dart';

void initChooseTranslationModule() {
  getIt.registerFactoryParam(
    (String param1, List<Word> param2) => ChooseTranslationCubit(topic: param1, words: param2),
  );
}
