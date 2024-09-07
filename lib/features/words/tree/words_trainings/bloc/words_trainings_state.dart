part of 'words_trainings_cubit.dart';

class WordsTrainingsState extends Equatable {
  final bool isLoading;
  final List<Word> words;
  final String jsonAsset;
  final String topic;
  final int rating;

  const WordsTrainingsState({
    required this.isLoading,
    required this.words,
    required this.jsonAsset,
    required this.topic,
    required this.rating,
  });

  WordsTrainingsState copyWith({
    bool? isLoading,
    List<Word>? words,
    String? jsonAsset,
    String? topic,
    int? rating,
  }) =>
      WordsTrainingsState(
        isLoading: isLoading ?? this.isLoading,
        words: words ?? this.words,
        jsonAsset: jsonAsset ?? this.jsonAsset,
        topic: topic ?? this.topic,
        rating: rating ?? this.rating,
      );

  @override
  List<Object?> get props => [
        isLoading,
        words,
        jsonAsset,
        rating,
      ];
}
