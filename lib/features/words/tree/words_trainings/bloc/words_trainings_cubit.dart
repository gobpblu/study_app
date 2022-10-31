import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:study_app/features/words/repository/words_repository_impl.dart';

import '../../../models/word.dart';

part 'words_trainings_state.dart';

class WordsTrainingsCubit extends Cubit<WordsTrainingsState> {
  WordsTrainingsCubit(int firstId, int lastId)
      : super(WordsTrainingsState(
          words: const [],
          isLoading: true,
          firstId: firstId,
          lastId: lastId,
        )) {
    loadWords();
  }

  final WordsRepositoryImpl _repository = Get.put(WordsRepositoryImpl());

  Future loadWords() async {
    print('I work');
    final words = await _repository.loadWords(state.firstId, state.lastId);
    emit(state.copyWith(words: words, isLoading: false));
  }
}
