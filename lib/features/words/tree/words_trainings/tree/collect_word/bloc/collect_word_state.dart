part of 'collect_word_cubit.dart';


class CollectWordState extends Equatable {
  final int id;
  final int firstId;
  final int lastId;
  final List<WordState> wordStates;
  final List<Word> words;
  final AudioPlayer player;
  final int points;

  const CollectWordState({
    required this.id,
    required this.firstId,
    required this.lastId,
    required this.wordStates,
    required this.words,
    required this.player,
    required this.points,
  });

  CollectWordState copyWith({
    int? id,
    int? firstId,
    int? lastId,
    List<WordState>? wordStates,
    List<Word>? words,
    AudioPlayer? player,
    int? points
  }) =>
      CollectWordState(
        id: id ?? this.id,
        firstId: firstId ?? this.firstId,
        lastId: lastId ?? this.lastId,
        wordStates: wordStates ?? this.wordStates,
        words: words ?? this.words,
        player: player ?? this.player,
        points: points ?? this.points,
      );

  @override
  List<Object?> get props => [id, firstId, lastId, wordStates, words, player];
}
