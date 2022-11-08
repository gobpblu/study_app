part of 'collect_listened_word_cubit.dart';

enum WordStatus { process, success, lastSuccess }

class CollectListenedWordState extends Equatable {
  final WordStatus status;
  final int index;
  final List<Word> words;
  final Map<String, int> characters;
  final List<String> formedWord;
  final int points;
  final Word currentWord;
  final bool shouldAnimate;
  final int guessedChars;
  final List<WordWithPoints> wordsWithPoints;
  final int currentWordPoints;
  final int currentWordMistakes;

  const CollectListenedWordState({
    required this.status,
    required this.index,
    required this.words,
    required this.characters,
    required this.points,
    required this.formedWord,
    required this.currentWord,
    required this.shouldAnimate,
    required this.guessedChars,
    required this.wordsWithPoints,
    required this.currentWordPoints,
    required this.currentWordMistakes,
  });

  CollectListenedWordState copyWith({
    WordStatus? status,
    int? index,
    List<Word>? words,
    Map<String, int>? characters,
    int? points,
    List<String>? formedWord,
    Word? currentWord,
    bool? shouldAnimate,
    int? guessedChars,
    List<WordWithPoints>? wordsWithPoints,
    int? currentWordPoints,
    int? currentWordMistakes,
  }) =>
      CollectListenedWordState(
        status: status ?? this.status,
        index: index ?? this.index,
        words: words ?? this.words,
        characters: characters ?? this.characters,
        points: points ?? this.points,
        formedWord: formedWord ?? this.formedWord,
        currentWord: currentWord ?? this.currentWord,
        shouldAnimate: shouldAnimate ?? this.shouldAnimate,
        guessedChars: guessedChars ?? this.guessedChars,
        wordsWithPoints: wordsWithPoints ?? this.wordsWithPoints,
        currentWordPoints: currentWordPoints ?? this.currentWordPoints,
        currentWordMistakes: currentWordMistakes ?? this.currentWordMistakes,
      );

  @override
  List<Object?> get props => [
        status,
        index,
        words,
        characters,
        points,
        formedWord,
        currentWord,
        shouldAnimate,
        guessedChars,
        wordsWithPoints,
        currentWordPoints,
        currentWordMistakes,
      ];
}
