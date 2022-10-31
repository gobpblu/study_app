import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/texts/repository/texts_repository.dart';
import 'package:study_app/features/texts/repository/texts_repository_impl.dart';

import '../models/text.dart';

part 'texts_event.dart';

part 'texts_state.dart';

class TextsBloc extends Bloc<TextsEvent, TextsState> {
  TextsBloc() : super(const TextsState(status: TextsStatus.initial)) {
    on<LoadTexts>(_onLoadTexts);
  }

  final TextsRepository _repository = TextsRepositoryImpl();

  Future<void> _onLoadTexts(
    LoadTexts event,
    Emitter<TextsState> emit,
  ) async {
    final texts = await _repository.loadTextsFromLocal(1);
    emit(state.copyWith(status: TextsStatus.success, texts: texts));
  }
}
