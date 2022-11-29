import 'package:equatable/equatable.dart';

class WordTopicTileItem extends Equatable {
  final String title;
  final String jsonPath;
  final String audiosPath;
  final String picturesPath;
  final String iconPath;
  final String topic;

  const WordTopicTileItem({
    required this.title,
    required this.jsonPath,
    required this.audiosPath,
    required this.picturesPath,
    required this.iconPath,
    required this.topic,
  });

  @override
  List<Object?> get props =>
      [title, jsonPath, audiosPath, picturesPath, iconPath, topic];
}
