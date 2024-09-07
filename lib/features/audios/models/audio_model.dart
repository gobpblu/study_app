import 'dart:typed_data';

import 'package:study_app/features/audios/data/db/audios_db_service.dart';

class AudioEntity {
  final String name;
  final String topic;
  final Uint8List audio;

  AudioEntity({required this.name, required this.topic, required this.audio});

  factory AudioEntity.fromJson(Map<String, dynamic> json) {
    return AudioEntity(
      name: json[AudiosDbService.columnName],
      topic: json[AudiosDbService.columnTopic],
      audio: json[AudiosDbService.columnAudio],
    );
  }

  Map<String, dynamic> toJson() => {
        AudiosDbService.columnName: name,
        AudiosDbService.columnTopic: topic,
        AudiosDbService.columnAudio: audio,
      };

  @override
  String toString() {
    return 'AudioEntity{name: $name, topic: $topic, audio: $audio}';
  }
}
