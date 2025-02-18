part of 'words_trainings_cubit.dart';

class WordsTrainingsState extends Equatable {
  final bool isLoading;
  final String loadingText;
  final List<Word> words;
  final int rating;

  const WordsTrainingsState({
    required this.isLoading,
    required this.loadingText,
    required this.words,
    required this.rating,
  });

  WordsTrainingsState copyWith({
    bool? isLoading,
    String? loadingText,
    List<Word>? words,
    int? rating,
  }) =>
      WordsTrainingsState(
        isLoading: isLoading ?? this.isLoading,
        loadingText: loadingText ?? this.loadingText,
        words: words ?? this.words,
        rating: rating ?? this.rating,
      );

  @override
  List<Object?> get props => [
        isLoading,
        loadingText,
        words,
        rating,
      ];
}
