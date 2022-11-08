import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:study_app/features/words/repository/words_repository_impl.dart';

import '../../../models/word.dart';

part 'words_trainings_2_state.dart';

class WordsTrainings2Cubit extends Cubit<WordsTrainings2State> {
  WordsTrainings2Cubit(String asset)
      : super(WordsTrainings2State(
            words: const [], isLoading: true, asset: asset)) {
    loadWords();
  }

  final WordsRepositoryImpl _repository = Get.put(WordsRepositoryImpl());

  Future loadWords() async {
    final words = await _repository.loadWords(1, 20);
    emit(state.copyWith(words: words, isLoading: false));
  }
}
