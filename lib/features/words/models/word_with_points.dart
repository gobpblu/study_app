import 'package:equatable/equatable.dart';

class WordWithPoints extends Equatable {

  const WordWithPoints({
    required this.id,
    required this.points,
    required this.isRight,
});

  final int id;
  final int points;
  final bool isRight;

  @override
  List<Object?> get props => [id, points, isRight];
}