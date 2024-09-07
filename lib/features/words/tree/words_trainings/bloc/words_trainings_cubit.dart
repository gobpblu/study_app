import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/words/repository/words_repository_impl.dart';

import '../../../models/word.dart';

part 'words_trainings_state.dart';

class WordsTrainingsCubit extends Cubit<WordsTrainingsState> {
  WordsTrainingsCubit({
    required String topic,
    required String jsonAsset,
    required WordsRepositoryImpl wordsRepository,
  })  : _repository = wordsRepository,
        super(WordsTrainingsState(
          isLoading: true,
          words: const [],
          jsonAsset: jsonAsset,
          topic: topic,
          rating: 0,
        )) {
    loadWords();
    loadRating();
  }

  final WordsRepositoryImpl _repository;

  Future loadWords() async {
    emit(state.copyWith(isLoading: true));
    final words = await _repository.getLocalWords(topic: state.jsonAsset, onlyTopic: state.topic);
    emit(state.copyWith(words: words, isLoading: false));
  }

  Future loadRating() async {
    final rating = await _repository.loadTopicRating(state.topic);
    emit(state.copyWith(isLoading: false, rating: rating));
  }
}
