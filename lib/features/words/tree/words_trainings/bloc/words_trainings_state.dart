part of 'words_trainings_cubit.dart';

class WordsTrainingsState extends Equatable {
  final bool isLoading;
  final List<Word> words;
  final String jsonAsset;
  final String audioAssetPath;
  final String picturesAssetPath;
  final String topic;
  final int rating;

  const WordsTrainingsState({
    required this.isLoading,
    required this.words,
    required this.jsonAsset,
    required this.audioAssetPath,
    required this.picturesAssetPath,
    required this.topic,
    required this.rating,
  });

  WordsTrainingsState copyWith({
    bool? isLoading,
    List<Word>? words,
    String? jsonAsset,
    String? audioAssetPath,
    String? picturesAssetPath,
    String? topic,
    int? rating,
  }) =>
      WordsTrainingsState(
        isLoading: isLoading ?? this.isLoading,
        words: words ?? this.words,
        jsonAsset: jsonAsset ?? this.jsonAsset,
        audioAssetPath: audioAssetPath ?? this.audioAssetPath,
        picturesAssetPath: picturesAssetPath ?? this.picturesAssetPath,
        topic: topic ?? this.topic,
        rating: rating ?? this.rating,
      );

  @override
  List<Object?> get props => [
        isLoading,
        words,
        jsonAsset,
        audioAssetPath,
        picturesAssetPath,
        rating,
      ];
}
