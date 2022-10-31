import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/words/models/word.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit(
    List<Word> words,
    int firstId,
    int lastId,
  ) : super(CardState(
          id: 0,
          words: words,
          firstId: firstId - 1,
          lastId: lastId - 1,
    player: AudioPlayer(),
        ));

  void showNextWord() {
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
