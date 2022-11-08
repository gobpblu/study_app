part of 'collect_word_cubit.dart';

enum CollectWordStatus { success, failure, submit }

class CollectWordState extends Equatable {
  final CollectWordStatus status;
  final int id;
  final int firstId;
  final int lastId;
  final List<WordState> wordStates;
  final List<Word> words;
  final AudioPlayer player;
  final int points;
  final String formedWord;
  final int seriesOfRightAnswers;

  const CollectWordState({
    required this.status,
    required this.id,
    required this.firstId,
    required this.lastId,
    required this.wordStates,
    required this.words,
    required this.player,
    required this.points,
    required this.formedWord,
    required this.seriesOfRightAnswers,
  });

  CollectWordState copyWith({
    CollectWordStatus? status,
    int? id,
    int? firstId,
    int? lastId,
    List<WordState>? wordStates,
    List<Word>? words,
    AudioPlayer? player,
    int? points,
    String? formedWord,
    int? seriesOfRightAnswers,
  }) =>
      CollectWordState(
        status: status ?? this.status,
        id: id ?? this.id,
        firstId: firstId ?? this.firstId,
        lastId: lastId ?? this.lastId,
        wordStates: wordStates ?? this.wordStates,
        words: words ?? this.words,
        player: player ?? this.player,
        points: points ?? this.points,
        formedWord: formedWord ?? this.formedWord,
        seriesOfRightAnswers: seriesOfRightAnswers ?? this.seriesOfRightAnswers,
      );

  @override
  List<Object?> get props => [
        status,
        id,
        firstId,
        lastId,
        wordStates,
        words,
        player,
        points,
        formedWord,
        seriesOfRightAnswers,
      ];
}
