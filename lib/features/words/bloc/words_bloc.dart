import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:study_app/features/words/repository/words_repository_impl.dart';

import '../models/word_tile_item.dart';

part 'words_event.dart';

part 'words_state.dart';

class WordsBloc extends Bloc<WordsEvent, WordsState> {
  WordsBloc()
      : super(const WordsState(
            status: WordsStatus.initial, isLoading: false, items: [])) {
    on<AddImage>(_onAddImage);
    on<LoadAllWords>(_onLoadAllWords);
    on<LoadParticularWords>(_onLoadParticularWords);
  }

  final WordsRepositoryImpl _repository = Get.put(WordsRepositoryImpl());

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
    final words = _repository.loadWords(event.firstId, event.lastId);
    // emit(state.copyWith())
  }
}
