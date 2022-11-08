part of 'words_trainings_2_cubit.dart';

class WordsTrainings2State extends Equatable {
  final bool isLoading;
  final List<Word> words;
  final String asset;

  const WordsTrainings2State({
    required this.isLoading,
    required this.words,
    required this.asset,
  });

  WordsTrainings2State copyWith({
    bool? isLoading,
    List<Word>? words,
    String? asset,
  }) =>
      WordsTrainings2State(
        isLoading: isLoading ?? this.isLoading,
        words: words ?? this.words,
        asset: asset ?? this.asset,
      );

  @override
  List<Object?> get props => [isLoading, words, asset];
}
