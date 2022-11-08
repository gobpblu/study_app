import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/words/models/word.dart';

import '../../../../../models/word_state.dart';

part 'collect_word_state.dart';

class CollectWordCubit extends Cubit<CollectWordState> {
  CollectWordCubit(List<Word> words,
      int firstId,
      int lastId,) : super(CollectWordState(
    status: CollectWordStatus.success,
    id: 0,
    words: words..shuffle(),
    wordStates: words.map((e) => WordState.neutral).toList(),
    firstId: firstId - 1,
    lastId: words.length - 1,
    player: AudioPlayer(),
    points: 0,
    formedWord: '',
    seriesOfRightAnswers: 0,
  ));

  void checkWord(String word) {
    final wordStates = state.wordStates;
    var rightWordsSeries = state.seriesOfRightAnswers;
    if (word == state.words[state.id].word) {
      wordStates[state.id] = WordState.done;
      rightWordsSeries += 1;
    } else {
      wordStates[state.id] = WordState.mistake;
      rightWordsSeries = 0;
    }
    if (state.id != state.lastId) {
      emit(state.copyWith(id: state.id + 1,
        status: CollectWordStatus.success,
        wordStates: wordStates,
        seriesOfRightAnswers: rightWordsSeries,
        formedWord: '',
      ));
    } else {
      emit(state.copyWith(status: CollectWordStatus.submit,
        wordStates: wordStates,
        seriesOfRightAnswers: rightWordsSeries,));
    }
  }

  void addNewCharacter(String character) {
    final newWord = state.formedWord + character;
    if (newWord.length == state.words[state.id].word.length) {
      checkWord(newWord);
    } else {
      emit(state.copyWith(formedWord: state.formedWord + character));
    }
  }

  void playAmericanAudio() async {
    await state.player.setSourceAsset(state.words[state.id].americanAudio);
    await state.player.resume();
  }

  void playBritishAudio() async {
    await state.player.setSourceAsset(state.words[state.id].britishAudio);
    await state.player.resume();
  }

  void showPreviousWord() {
    if (state.id > state.firstId) {
      emit(state.copyWith(id: state.id - 1));
    } else {
      emit(state.copyWith(id: state.lastId));
    }
  }
}
