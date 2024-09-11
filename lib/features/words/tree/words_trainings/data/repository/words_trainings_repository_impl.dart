import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:study_app/features/audios/data/db/audios_db_service.dart';
import 'package:study_app/features/audios/data/firebase/audio_firebase_storage.dart';
import 'package:study_app/features/audios/models/audio_model.dart';
import 'package:study_app/features/ratings/db/ratings_hive.dart';
import 'package:study_app/features/realtime_database/service/realtime_database_service.dart';
import 'package:study_app/features/words/models/raw_word.dart';
import 'package:study_app/features/words/models/word.dart';
import 'package:study_app/features/words/tree/words_trainings/domain/repository/words_training_repository.dart';
import 'package:get/get.dart';

class WordsTrainingsRepositoryImpl implements WordsTrainingsRepository {
  final AudiosDbService _dbService;
  final AudioFirebaseStorage _audioStorage;
  final RealtimeDatabaseService _realtimeDatabaseService;
  final RatingsHive _ratingsHive;

  WordsTrainingsRepositoryImpl({
    required AudiosDbService dbService,
    required AudioFirebaseStorage audioStorage,
    required RatingsHive ratingsHive,
    required RealtimeDatabaseService realtimeDatabaseService,
  })  : _dbService = dbService,
        _audioStorage = audioStorage,
        _ratingsHive = ratingsHive,
        _realtimeDatabaseService = realtimeDatabaseService;

  @override
  Future<List<Word>> getLocalWords({required String topic, required String onlyTopic}) async {
    final List<Word> words = [];
    final jsonWords = await rootBundle.loadString(topic /*'assets/words/topics/words_$topic.json'*/);
    final rawWords = (json.decode(jsonWords) as List<dynamic>).map((e) => RawWord.fromJson(e)).toList();
    final topicDbAudios = await _dbService.getAudiosByTopic(onlyTopic);
    for (var item in rawWords) {
      final word = Word(
        word: item.word,
        transcription: item.transcription,
        translation: item.translation,
        // image: 'assets/words/images/$topic/${item.word}.jpg',
        audio: _getAudio(item.word, topic),
        audioBytes: await _getAudioBytes(topicDbAudios, item.word, onlyTopic),
      );
      words.add(word);
    }
    return words;
  }

  @override
  Future<int> loadTopicRating(String topic) async {
    final connectivity = await (Connectivity().checkConnectivity());

    if (connectivity.firstOrNull == ConnectivityResult.mobile || connectivity.firstOrNull == ConnectivityResult.wifi) {
      final topicRating = await _realtimeDatabaseService.getTopicRating(topic);
      _ratingsHive.saveUserRatingByTopic(topic, topicRating);
      return topicRating;
    } else {
      return await _ratingsHive.getUserRatingByTopic(topic);
    }
  }

  String _getAudio(String word, String topic) {
    if (word.contains(' ')) {
      final newWord = word.replaceAll(' ', '_');
      return 'words/audio/$topic/$newWord.mp3';
    } else {
      return 'words/audio/$topic/$word.mp3';
    }
  }

  Future<Uint8List?> _getAudioBytes(List<AudioEntity> dbAudios, String word, String topic) async {
    final dbAudio = dbAudios.firstWhereOrNull((element) => element.name == word);
    if (dbAudio != null) {
      return dbAudio.audio;
    } else {
      final audioFromFbStorage = await _audioStorage.getAudio(topic: topic, word: word);
      if (audioFromFbStorage != null) {
        final entity = AudioEntity(name: word, topic: topic, audio: audioFromFbStorage);
        _dbService.insertItem(entity);
        return audioFromFbStorage;
      }
    }
    return null;
  }
}
