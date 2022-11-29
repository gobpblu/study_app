import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:study_app/features/words/repository/words_repository_impl.dart';

import '../../../models/word.dart';

part 'words_trainings_state.dart';

class WordsTrainingsCubit extends Cubit<WordsTrainingsState> {
  WordsTrainingsCubit({
    required String topic,
    required String jsonAsset,
    required String audioAssetPath,
    required String picturesAssetPath,
  }) : super(WordsTrainingsState(
          isLoading: true,
          words: const [],
          jsonAsset: jsonAsset,
          audioAssetPath: audioAssetPath,
          picturesAssetPath: picturesAssetPath,
          topic: topic,
          rating: 0,
        )) {
    loadWords();
    loadRating();
  }

  final WordsRepositoryImpl _repository = Get.put(WordsRepositoryImpl());

  Future loadWords() async {
    final words = await _repository.getLocalWords(topic: state.topic);
    emit(state.copyWith(words: words));
  }

  Future loadRating() async {
    emit(state.copyWith(isLoading: true));
    final rating = await _repository.loadTopicRating(state.topic);
    emit(state.copyWith(isLoading: false, rating: rating));
  }
}
