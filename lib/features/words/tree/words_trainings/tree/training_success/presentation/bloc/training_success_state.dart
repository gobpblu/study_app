part of 'training_success_cubit.dart';

class TrainingSuccessState extends Equatable {
  const TrainingSuccessState({
    required this.words,
    required this.rightWords,
  });

  final List<WordWithPoints> words;
  final int rightWords;

  TrainingSuccessState copyWith({
    List<WordWithPoints>? words,
    int? rightWords,
  }) =>
      TrainingSuccessState(
        words: words ?? this.words,
        rightWords: rightWords ?? this.rightWords,
      );

  @override
  List<Object?> get props => [words, rightWords];
}
