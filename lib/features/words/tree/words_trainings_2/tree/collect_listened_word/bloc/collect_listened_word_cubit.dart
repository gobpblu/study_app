import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:study_app/features/words/models/word.dart';
import 'package:study_app/features/words/models/word_with_points.dart';

part 'collect_listened_word_state.dart';

class CollectListenedWordCubit extends Cubit<CollectListenedWordState> {
  CollectListenedWordCubit(List<Word> words)
      : super(CollectListenedWordState(
          status: WordStatus.process,
          index: 0,
          words: words,
          characters: _generateMap(words[0].word),
          points: 0,
          formedWord: List.generate(words[0].word.length, (index) => '_'),
          currentWord: words[0],
          shouldAnimate: false,
          guessedChars: 0,
          wordsWithPoints: const [],
          currentWordPoints: 0,
          currentWordMistakes: 0,
        ));

  final player = AudioPlayer();

  static Map<String, int> _generateMap(String word) {
    Map<String, int> map = {};
    List<String> chars = word.characters.toList();
    chars.shuffle();
    for (var char in chars) {
      map[char] = (map[char] ?? 0) + 1;
    }
    return map;
  }

  Future playRightSound() async {
    await player.stop();
    await player.setSourceAsset('audio/signals/right_sound.mp3');
    player.resume();
  }

  Future playWrongSound() async {
    await player.stop();
    await player.setSourceAsset('audio/signals/mistake_sound.mp3');
    player.resume();
  }

  void addNewCharacter(String character) {
    state.characters[character] = (state.characters[character] ?? 0) - 1;
    state.formedWord.removeAt(state.guessedChars);
    state.formedWord.insert(state.guessedChars, character);
  }

  bool isLastWord() => state.index == 9;

  bool isGuessedAllWord() =>
      state.guessedChars + 1 == state.currentWord.word.length;

  bool isCorrectCharacter(String character) =>
      character == state.currentWord.word[state.guessedChars];

  void lastWordSuccessEmit() {
    final wordWithPoints = WordWithPoints(
        id: state.currentWord.id,
        points: state.currentWordPoints + 1,
        isRight: state.currentWordMistakes <= 1);
    emit(state.copyWith(
      status: WordStatus.lastSuccess,
      points: state.points + 1,
      wordsWithPoints: List.of(state.wordsWithPoints)..add(wordWithPoints),
    ));
  }

  Future wordSuccessEmit() async {
    final wordWithPoints = WordWithPoints(
        id: state.currentWord.id,
        points: state.currentWordPoints + 1,
        isRight: state.currentWordMistakes <= 1);
    emit(state.copyWith(
      status: WordStatus.success,
      currentWord: state.words[state.index + 1],
      index: state.index + 1,
      points: state.points + 1,
      currentWordPoints: 0,
      currentWordMistakes: 0,
      formedWord: List.generate(
          state.words[state.index + 1].word.length, (index) => '_'),
      characters: _generateMap(state.words[state.index + 1].word),
      guessedChars: 0,
      wordsWithPoints: List.of(state.wordsWithPoints)..add(wordWithPoints),
    ));
    await Future.delayed(const Duration(milliseconds: 300));
    emit(state.copyWith(status: WordStatus.process));
    await playAudio();
  }

  void wordProcessEmit() {
    emit(state.copyWith(
      status: WordStatus.process,
      guessedChars: state.guessedChars + 1,
      characters: Map.of(state.characters),
      formedWord: List.of(state.formedWord),
      points: state.points + 1,
      currentWordPoints: state.currentWordPoints + 1,
    ));
  }

  Future emitMistake() async {
    await playWrongSound();
    emit(state.copyWith(
      status: WordStatus.process,
      points: state.points - 1,
      currentWordPoints: state.currentWordPoints - 1,
      currentWordMistakes: state.currentWordMistakes + 1,
    ));
  }

  void checkCharacter(String character) async {
    if (isCorrectCharacter(character)) {
      await playRightSound();
      addNewCharacter(character);
      if (isGuessedAllWord()) {
        isLastWord() ? lastWordSuccessEmit() : await wordSuccessEmit();
      } else {
        wordProcessEmit();
      }
    } else {
      await emitMistake();
    }
  }

  Future playAudio() async {
    emit(state.copyWith(shouldAnimate: true));
    await player.setSourceAsset(state.currentWord.americanAudio);
    final duration = await player.getDuration();
    await player.resume();
    if (duration != null) await Future.delayed(duration);
    emit(state.copyWith(shouldAnimate: false));
  }
}
