import 'dart:typed_data';

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
  final String word;
  final String transcription;
  final String translation;
  final String? image;
  final String audio;
  final Uint8List? audioBytes;

  // final String britishAudio;

  const Word({
    required this.word,
    required this.transcription,
    required this.translation,
    this.image,
    required this.audio,
    this.audioBytes,
    // required this.britishAudio,
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
    String? word,
    String? transcription,
    String? translation,
    String? image,
    String? audio,
    // String? britishAudio,
  }) =>
      Word(
        word: word ?? this.word,
        transcription: transcription ?? this.transcription,
        translation: translation ?? this.translation,
        image: image ?? this.image,
        audio: audio ?? this.audio,
        // britishAudio: britishAudio ?? this.britishAudio,
      );

  @override
  List<Object?> get props => [
        word,
        transcription,
        image,
        audio,
        // britishAudio,
      ];
}
