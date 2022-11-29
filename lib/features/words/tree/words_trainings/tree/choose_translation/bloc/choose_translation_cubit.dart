import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../models/word.dart';
import '../../../../../models/word_with_points.dart';
import '../models/picked_word.dart';

part 'choose_translation_state.dart';

class ChooseTranslationCubit extends Cubit<ChooseTranslationState> {
  ChooseTranslationCubit({required String topic, required List<Word> words})
      : super(ChooseTranslationState(
          index: 0,
          status: ChooseTranslationStatus.initial,
          topic: topic,
          words: words..shuffle(),
          wordsWithPoints: const [],
          currentWord: words[0],
          wordsOnScreen: [
            words[0],
            ...words.where((element) => element != words[0]).take(5)
          ],
          points: 0,
          currentWordPoints: 0,
          pickedWord: PickedWord(index: -1, isRight: false),
        ));

  final player = AudioPlayer();

  Future playRightSound() async {
    await player.stop();
    await player.setSourceAsset('audio/signals/right_sound.mp3');
    await player.resume();
  }

  Future playWrongSound() async {
    await player.stop();
    await player.setSourceAsset('audio/signals/mistake_sound.mp3');
    await player.resume();
  }

  Future playAudio(int index) async {
    await player.setSourceAsset(state.currentWord.audio);
    await player.resume();
    final duration = await player.getDuration();
    if (duration != null) await Future.delayed(duration);
  }

  void chooseWord(String word, pickedIndex) async {
    late WordWithPoints wordWithPoints;
    late ChooseTranslationStatus status;
    late int points;
    if (_isCorrectWord(word)) {
      wordWithPoints = WordWithPoints(word: word, points: 5, isRight: true);
      if (_isLastWord()) {
        status = ChooseTranslationStatus.lastSuccess;
        points = state.points + 5;
      } else {
        status = ChooseTranslationStatus.right;
        points = state.points + 5;
      }
    } else {
      wordWithPoints = WordWithPoints(word: word, points: -5, isRight: false);
      if (_isLastWord()) {
        status = ChooseTranslationStatus.lastSuccess;
        points = state.points - 5;
      } else {
        status = ChooseTranslationStatus.wrong;
        points = state.points - 5;
      }
    }
    wordWithPoints.isRight ? await playRightSound() : await playWrongSound();
    emit(state.copyWith(
      pickedWord:
      PickedWord(index: pickedIndex, isRight: wordWithPoints.isRight),
    ));
    await playAudio(state.index);
    final index = state.index == 9 ? state.index : state.index + 1;
    emit(state.copyWith(
        index: index,
        status: status,
        points: points,
        wordsWithPoints: List.of(state.wordsWithPoints)..add(wordWithPoints),
        currentWord: state.words[index],
        wordsOnScreen: [
          state.words[index],
          ...state.words
              .where((element) => element != state.words[index])
              .take(5)
        ],
        pickedWord: const PickedWord(index: -1, isRight: false)));
  }

  bool _isCorrectWord(String word) => word == state.currentWord.word;

  bool _isLastWord() => state.currentWord == state.words[9];
}
