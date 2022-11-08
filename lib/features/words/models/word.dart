import 'package:equatable/equatable.dart';

class WordField {
  static const String id = '_id';
  static const String word = 'word';
  static const String transcription = 'transcription';
  static const String translation = 'translation';
  static const String audio = 'audio';
  static const String image = 'image';

  static final List<String> values = [
    id,
    word,
    transcription,
    translation,
    audio,
    image,
  ];
}

class Word extends Equatable {
  final int id;
  final String word;
  final String americanTranscription;
  final String britishTranscription;
  final String translation;
  final String image;
  final String americanAudio;
  final String britishAudio;

  const Word({
    required this.id,
    required this.word,
    required this.americanTranscription,
    required this.britishTranscription,
    required this.translation,
    required this.image,
    required this.americanAudio,
    required this.britishAudio,
  });

  /*Word.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        word = json['word'],
        americanTranscription = json['american_transcription'],
        britishTranscription = json['british_transcription'],
        translation = json['translation'],
        ;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'word': word,
        'american_transcription': americanTranscription,
        'british_transcription': britishTranscription,
        'translation': translation,
      };*/

  Word copyWith({
    int? id,
    String? word,
    String? americanTranscription,
    String? britishTranscription,
    String? translation,
    String? image,
    String? americanAudio,
    String? britishAudio,
  }) =>
      Word(
        id: id ?? this.id,
        word: word ?? this.word,
        americanTranscription:
            americanTranscription ?? this.americanTranscription,
        britishTranscription: britishTranscription ?? this.britishTranscription,
        translation: translation ?? this.translation,
        image: image ?? this.image,
        americanAudio: americanAudio ?? this.americanAudio,
        britishAudio: britishAudio ?? this.britishAudio,
      );

  @override
  List<Object?> get props => [
        id,
        word,
        americanTranscription,
        britishTranscription,
        image,
        americanAudio,
        britishAudio,
      ];
}
