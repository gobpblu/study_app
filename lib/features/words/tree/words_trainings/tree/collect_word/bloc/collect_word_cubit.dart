import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/words/models/word.dart';

import '../../../../../models/word_state.dart';

part 'collect_word_state.dart';

class CollectWordCubit extends Cubit<CollectWordState> {
  CollectWordCubit(
    List<Word> words,
    int firstId,
    int lastId,
  ) : super(CollectWordState(
          id: 0,
          words: words..shuffle(),
          wordStates: words.map((e) => WordState.neutral).toList(),
          firstId: firstId - 1,
          lastId: lastId - 1,
          player: AudioPlayer(),
          points: 0,
        ));

  void checkWord() {
    if (state.id < state.lastId) {
      emit(state.copyWith(id: state.id + 1));
    } else {
      emit(state.copyWith(id: state.firstId));
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
