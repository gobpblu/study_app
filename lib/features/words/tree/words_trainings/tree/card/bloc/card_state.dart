part of 'card_cubit.dart';

class CardState extends Equatable {
  final int id;
  final int firstId;
  final int lastId;
  final List<Word> words;
  final AudioPlayer player;

  const CardState({
    required this.id,
    required this.firstId,
    required this.lastId,
    required this.words,
    required this.player,
  });

  CardState copyWith({
    int? id,
    int? firstId,
    int? lastId,
    List<Word>? words,
    AudioPlayer? player,
  }) =>
      CardState(
        id: id ?? this.id,
        firstId: firstId ?? this.firstId,
        lastId: lastId ?? this.lastId,
        words: words ?? this.words,
        player: player ?? this.player,
      );

  @override
  List<Object?> get props => [id, firstId, lastId, words, player];
}
