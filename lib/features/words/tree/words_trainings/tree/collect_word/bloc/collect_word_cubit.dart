import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:study_app/features/words/models/word.dart';
import 'package:study_app/features/words/models/word_with_points.dart';

import '../../../models/word_status_enum.dart';

part 'collect_word_state.dart';

class CollectWordCubit extends Cubit<CollectWordState> {
  CollectWordCubit(List<Word> words)
      : super(CollectWordState(
          status: WordStatus.process,
          isLoading: false,
          index: 0,
          words: words,
          characters: _generateCharacters(words[0].word),
          points: 0,
          formedWord: List.generate(words[0].word.length, (index) => '_'),
          currentWord: words[0],
          shouldAnimate: false,
          guessedChars: 0,
          wordsWithPoints: const [],
          currentWordPoints: 0,
          currentWordMistakes: 0,
        ));

  final soundsPlayer = AudioPlayer();

  static Map<String, int> _generateMap(String word) {
    Map<String, int> map = {};
    List<String> chars = word.characters.toList();
    chars.shuffle();
    for (var char in chars) {
      map[char] = (map[char] ?? 0) + 1;
    }
    return map;
  }

  static List<String> _generateCharacters(String word) {
    List<String> chars = word.characters.toList();
    chars.shuffle();
    return chars;
  }

  Future playRightSound() async {
    await soundsPlayer.stop();
    await soundsPlayer.setSourceAsset('audio/signals/right_sound.mp3');
    soundsPlayer.resume();
  }

  Future playWrongSound() async {
    await soundsPlayer.stop();
    await soundsPlayer.setSourceAsset('audio/signals/mistake_sound.mp3');
    soundsPlayer.resume();
  }

  void addNewCharacter(String character, int index) {
    state.characters[index] = '';
    state.formedWord.removeAt(state.guessedChars);
    state.formedWord.insert(state.guessedChars, character);
  }

  bool isLastWord() => state.index == 9;

  bool isGuessedAllChars() => state.guessedChars + 1 == state.currentWord.word.length;

  bool isCorrectCharacter(String character) => character == state.currentWord.word[state.guessedChars];

  void lastWordSuccessEmit() {
    final wordWithPoints = WordWithPoints(
      word: state.currentWord.word,
      points: state.currentWordPoints + 1,
      isRight: state.currentWordMistakes <= 1,
    );
    emit(state.copyWith(
      status: WordStatus.lastSuccess,
      points: state.points + 1,
      wordsWithPoints: List.of(state.wordsWithPoints)..add(wordWithPoints),
    ));
  }

  Future wordSuccessEmit() async {
    final wordWithPoints = WordWithPoints(
        word: state.currentWord.word, points: state.currentWordPoints + 1, isRight: state.currentWordMistakes <= 1);
    emit(state.copyWith(
      status: WordStatus.success,
      isLoading: true,
    ));
    await Future.delayed(const Duration(milliseconds: 300));
    emit(state.copyWith(
      status: WordStatus.process,
      currentWord: state.words[state.index + 1],
      index: state.index + 1,
      points: state.points + 1,
      currentWordPoints: 0,
      currentWordMistakes: 0,
      formedWord: List.generate(state.words[state.index + 1].word.length, (index) => '_'),
      characters: _generateCharacters(state.words[state.index + 1].word),
      guessedChars: 0,
      wordsWithPoints: List.of(state.wordsWithPoints)..add(wordWithPoints),
    ));
  }

  void wordProcessEmit() {
    emit(state.copyWith(
      status: WordStatus.process,
      guessedChars: state.guessedChars + 1,
      characters: List.of(state.characters),
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

  void checkCharacter(String character, int index) async {
    if (isCorrectCharacter(character)) {
      await playRightSound();
      addNewCharacter(character, index);
      if (isGuessedAllChars()) {
        isLastWord() ? lastWordSuccessEmit() : wordSuccessEmit();
      } else {
        wordProcessEmit();
      }
    } else {
      await emitMistake();
    }
  }
}
