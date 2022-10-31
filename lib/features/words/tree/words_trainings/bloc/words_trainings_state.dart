part of 'words_trainings_cubit.dart';

class WordsTrainingsState extends Equatable {
  final bool isLoading;
  final List<Word> words;
  final int firstId;
  final int lastId;

  const WordsTrainingsState({
    required this.isLoading,
    required this.words,
    required this.firstId,
    required this.lastId,
  });

  WordsTrainingsState copyWith({
    bool? isLoading,
    List<Word>? words,
    int? firstId,
    int? lastId,
  }) =>
      WordsTrainingsState(
        isLoading: isLoading ?? this.isLoading,
        words: words ?? this.words,
        firstId: firstId ?? this.firstId,
        lastId: lastId ?? this.lastId,
      );

  @override
  List<Object?> get props => [isLoading, words, firstId, lastId];
}
