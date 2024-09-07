import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/levels/domain/models/level_data.dart';
import 'package:study_app/features/words/repository/words_repository_impl.dart';

import '../models/word_topic_tile_item.dart';

part 'words_event.dart';
part 'words_state.dart';

class WordsBloc extends Bloc<WordsEvent, WordsState> {
  WordsBloc({
    required WordsRepositoryImpl wordsRepository,
  })  : _repository = wordsRepository,
        super(const WordsState(status: WordsStatus.initial, isLoading: false, items: [])) {
    on<AddImage>(_onAddImage);
    on<LoadAllWords>(_onLoadAllWords);
    on<LoadParticularWords>(_onLoadParticularWords);
    on<LoadAllWordsTopics>(_onLoadAllWordsTopics);
  }

  final WordsRepositoryImpl _repository;

  void _onAddImage(
    AddImage event,
    Emitter<WordsState> emit,
  ) {
    emit(state.copyWith(image: event.image));
  }

  void _onLoadAllWords(
    LoadAllWords event,
    Emitter<WordsState> emit,
  ) {
    emit(state.copyWith(isLoading: true, status: WordsStatus.initial));
    final wordTiles = _repository.loadAllWordTiles();
    emit(state.copyWith(items: wordTiles, status: WordsStatus.success));
  }

  void _onLoadParticularWords(
    LoadParticularWords event,
    Emitter<WordsState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
  }

  void _onLoadAllWordsTopics(
    LoadAllWordsTopics event,
    Emitter<WordsState> emit,
  ) {
    final List<WordTopicTileItem> topics;
    if (event.level == LevelEnum.intermediate) {
      topics = _repository.loadIntermediateWordsTopics();
    } else {
      topics = _repository.loadBeginnerWordsTopics();
    }
    // final wordsTiles = _repository.loadBeginnerWordsTopics();
    emit(state.copyWith(status: WordsStatus.success, items: topics));
  }
}
