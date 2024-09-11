part of 'collect_listened_word_cubit.dart';

class CollectListenedWordState extends Equatable {
  final WordStatus status;
  final int index;
  final List<Word> words;
  final List<String> characters;
  final List<String> formedWord;
  final int points;
  final Word currentWord;
  final bool shouldAnimate;
  final int guessedChars;
  final List<WordWithPoints> wordsWithPoints;
  final int currentWordPoints;
  final int currentWordMistakes;
  final AudioPlayer audioPlayer;

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
    required this.audioPlayer,
  });

  CollectListenedWordState copyWith({
    WordStatus? status,
    int? index,
    List<Word>? words,
    List<String>? characters,
    int? points,
    List<String>? formedWord,
    Word? currentWord,
    bool? shouldAnimate,
    int? guessedChars,
    List<WordWithPoints>? wordsWithPoints,
    int? currentWordPoints,
    int? currentWordMistakes,
    AudioPlayer? audioPlayer,
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
        audioPlayer: audioPlayer ?? this.audioPlayer,
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
    audioPlayer,
      ];
}
