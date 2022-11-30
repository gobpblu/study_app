class RawWord {
  final String word;
  final String transcription;
  final String translation;

  const RawWord({
    required this.word,
    required this.transcription,
    required this.translation,
  });

  RawWord.fromJson(Map<String, dynamic> json)
      : word = json['word'],
        transcription = json['transcription'],
        translation = json['translation'];

  Map<String, dynamic> toJson() => {
        'word': word,
        'transcription': transcription,
        'translation': translation,
      };

  RawWord copyWith({
    String? word,
    String? transcription,
    String? translation,
  }) =>
      RawWord(
        word: word ?? this.word,
        transcription:
            transcription ?? this.transcription,
        translation: translation ?? this.translation,
      );

  @override
  String toString() {
    return toJson().toString();
  }
}
