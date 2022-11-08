class RawWord {
  final int id;
  final String word;
  final String americanTranscription;
  final String britishTranscription;
  final String translation;

  const RawWord({
    required this.id,
    required this.word,
    required this.americanTranscription,
    required this.britishTranscription,
    required this.translation,
  });

  RawWord.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        word = json['word'],
        americanTranscription = json['american_transcription'],
        britishTranscription = json['british_transcription'],
        translation = json['translation'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'word': word,
        'americanTranscription': americanTranscription,
        'britishTranscription': britishTranscription,
        'translation': translation,
      };

  RawWord copyWith({
    int? id,
    String? word,
    String? americanTranscription,
    String? britishTranscription,
    String? translation,
  }) =>
      RawWord(
        id: id ?? this.id,
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
