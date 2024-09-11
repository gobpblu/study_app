part of 'words_trainings_cubit.dart';

class WordsTrainingsState extends Equatable {
  final bool isLoading;
  final List<Word> words;
  final int rating;

  const WordsTrainingsState({
    required this.isLoading,
    required this.words,
    required this.rating,
  });

  WordsTrainingsState copyWith({
    bool? isLoading,
    List<Word>? words,
    int? rating,
  }) =>
      WordsTrainingsState(
        isLoading: isLoading ?? this.isLoading,
        words: words ?? this.words,
        rating: rating ?? this.rating,
      );

  @override
  List<Object?> get props => [
        isLoading,
        words,
        rating,
      ];
}
