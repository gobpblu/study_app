import 'package:equatable/equatable.dart';

class WordWithPoints extends Equatable {

  const WordWithPoints({
    required this.word,
    required this.points,
    required this.isRight,
});

  final String word;
  final int points;
  final bool isRight;

  @override
  List<Object?> get props => [word, points, isRight];
}