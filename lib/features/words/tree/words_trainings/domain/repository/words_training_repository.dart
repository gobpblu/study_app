import 'package:flutter/foundation.dart';
import 'package:study_app/features/audios/models/audio_model.dart';
import 'package:study_app/features/words/models/raw_word.dart';

abstract class WordsTrainingsRepository {
  Future<List<RawWord>> getRawWords({required String topic});

  Future<List<AudioEntity>> getDbAudios({required String topic});

  Future<Map<String, Future<Uint8List?>>?> getStorageAudios({required String topic});

  Future<Uint8List?> getAudioBytes(List<AudioEntity> dbAudios, String word, String topic);

  Future saveAudio({required AudioEntity audio});

  String getAudio({required String word, required String topic});

  Future<int> loadTopicRating(String topic);
}
