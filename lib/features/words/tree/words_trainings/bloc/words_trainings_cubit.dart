import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/words/tree/words_trainings/domain/repository/words_training_repository.dart';

import '../../../models/word.dart';

part 'words_trainings_state.dart';

class WordsTrainingsCubit extends Cubit<WordsTrainingsState> {
  WordsTrainingsCubit({
    required WordsTrainingsRepository wordsRepository,
  })  : _repository = wordsRepository,
        super(const WordsTrainingsState(
          isLoading: true,
          words: [],
          rating: 0,
        ));

  final WordsTrainingsRepository _repository;

  Future loadWords({required String jsonAsset, required String topic}) async {
    emit(state.copyWith(isLoading: true));
    final words = await _repository.getLocalWords(topic: jsonAsset, onlyTopic: topic);
    emit(state.copyWith(words: words, isLoading: false));
  }

  Future loadRating({required String topic}) async {
    final rating = await _repository.loadTopicRating(topic);
    emit(state.copyWith(isLoading: false, rating: rating));
  }
}
