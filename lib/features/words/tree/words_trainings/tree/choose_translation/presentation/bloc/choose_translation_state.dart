part of 'choose_translation_cubit.dart';

enum ChooseTranslationStatus { initial, right, wrong, lastSuccess }

class ChooseTranslationState extends Equatable {
  final int index;
  final ChooseTranslationStatus status;
  final String topic;
  final List<Word> words;
  final List<WordWithPoints> wordsWithPoints;
  final Word currentWord;
  final List<Word> wordsOnScreen;
  final int points;
  final int currentWordPoints;
  final PickedWord pickedWord;

  const ChooseTranslationState({
    required this.index,
    required this.status,
    required this.topic,
    required this.words,
    required this.wordsWithPoints,
    required this.currentWord,
    required this.wordsOnScreen,
    required this.points,
    required this.currentWordPoints,
    required this.pickedWord,
  });

  ChooseTranslationState copyWith({
    int? index,
    ChooseTranslationStatus? status,
    String? topic,
    List<Word>? words,
    List<WordWithPoints>? wordsWithPoints,
    Word? currentWord,
    List<Word>? wordsOnScreen,
    int? points,
    int? currentWordPoints,
    PickedWord? pickedWord,
  }) =>
      ChooseTranslationState(
        index: index ?? this.index,
        status: status ?? this.status,
        topic: topic ?? this.topic,
        words: words ?? this.words,
        wordsWithPoints: wordsWithPoints ?? this.wordsWithPoints,
        currentWord: currentWord ?? this.currentWord,
        wordsOnScreen: wordsOnScreen ?? this.wordsOnScreen,
        points: points ?? this.points,
        currentWordPoints: currentWordPoints ?? this.currentWordPoints,
        pickedWord: pickedWord ?? this.pickedWord,
      );

  @override
  List<Object?> get props => [
        index,
        status,
        topic,
        words,
        wordsWithPoints,
        currentWord,
        wordsOnScreen,
        points,
        currentWordPoints,
        pickedWord,
      ];
}
