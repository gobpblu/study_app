part of 'enter_word_cubit.dart';

enum EnterWordStatus { process, success, lastSuccess }

class EnterWordState extends Equatable {
  final EnterWordStatus status;
  final String word;
  final Map<String, int> characters;
  final int guessedChars;
  final List<String> formedWord;

  const EnterWordState({
    required this.status,
    required this.word,
    required this.characters,
    required this.guessedChars,
    required this.formedWord,
  });

  EnterWordState copyWith({
    EnterWordStatus? status,
    String? word,
    Map<String, int>? characters,
    int? guessedChars,
    List<String>? formedWord,
  }) =>
      EnterWordState(
        status: status ?? this.status,
        word: word ?? this.word,
        characters: characters ?? this.characters,
        guessedChars: guessedChars ?? this.guessedChars,
        formedWord: formedWord ?? this.formedWord,
      );

  @override
  List<Object?> get props => [status, word, characters, guessedChars, formedWord];
}
