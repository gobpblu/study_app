import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'enter_word_state.dart';

class EnterWordCubit extends Cubit<EnterWordState> {
  EnterWordCubit(String word)
      : super(EnterWordState(
          status: EnterWordStatus.process,
          word: word,
          characters: _generateMap(word),
          guessedChars: 0,
          formedWord: List.generate(word.length, (index) => '_'),
        ));

  final AudioPlayer audioPlayer = AudioPlayer();

  static Map<String, int> _generateMap(String word) {
    Map<String, int> map = {};
    for (var char in word.characters) {
      map[char] = (map[char] ?? 0) + 1;
    }
    return map;
  }

  void checkCharacter(String character) async {
    if (character == state.word[state.guessedChars]) {
      await audioPlayer.stop();
      await audioPlayer.setSourceAsset('audio/signals/right_sound.mp3');
      audioPlayer.resume();
      state.characters[character] = (state.characters[character] ?? 0) - 1;
      state.formedWord.removeAt(state.guessedChars);
      state.formedWord.insert(state.guessedChars, character);
      emit(state.copyWith(
        // status: EnterWordStatus.success,
        guessedChars: state.guessedChars + 1,
        characters: Map.of(state.characters),
        formedWord: List.of(state.formedWord),
      ));
      if (state.guessedChars != state.word.length) {
        // await Future.delayed(const Duration(milliseconds: 500));
        // emit(state.copyWith(
        //     status: EnterWordStatus.process,
        // ));
      } else {
        emit(state.copyWith(status: EnterWordStatus.lastSuccess));
      }
    } else {
      await audioPlayer.stop();
      await audioPlayer.setSourceAsset('audio/signals/mistake_sound.mp3');
      audioPlayer.resume();
    }
  }
}
