class RawWord {
  final String word;
  final String americanTranscription;
  final String britishTranscription;
  final String translation;

  const RawWord({
    required this.word,
    required this.americanTranscription,
    required this.britishTranscription,
    required this.translation,
  });

  RawWord.fromJson(Map<String, dynamic> json)
      : word = json['word'],
        americanTranscription = json['american_transcription'],
        britishTranscription = json['british_transcription'],
        translation = json['translation'];

  Map<String, dynamic> toJson() => {
        'word': word,
        'americanTranscription': americanTranscription,
        'britishTranscription': britishTranscription,
        'translation': translation,
      };

  RawWord copyWith({
    String? word,
    String? americanTranscription,
    String? britishTranscription,
    String? translation,
  }) =>
      RawWord(
        word: word ?? this.word,
        americanTranscription:
            americanTranscription ?? this.americanTranscription,
        britishTranscription: britishTranscription ?? this.britishTranscription,
        translation: translation ?? this.translation,
      );

  @override
  String toString() {
    return toJson().toString();
  }
}
