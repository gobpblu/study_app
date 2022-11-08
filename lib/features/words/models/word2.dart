import 'package:equatable/equatable.dart';

class Word2 extends Equatable {
  const Word2({required this.word, required this.audioAsset});

  final String word;
  final String audioAsset;

  Word2.fromJson(Map<String, dynamic> json)
      : word = json['word'],
        audioAsset = json['audioAsset'];

  Map<String, dynamic> toJson() => {
    'word': word,
    'audioAsset': audioAsset,
  };

  @override
  List<Object?> get props => [word, audioAsset];
}
