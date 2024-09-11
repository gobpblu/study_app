import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_app/features/audios/data/db/audios_db_service.dart';
import 'package:study_app/features/audios/models/audio_model.dart';
import 'package:study_app/features/ratings/db/ratings_hive.dart';
import 'package:study_app/features/realtime_database/service/realtime_database_service.dart';
import 'package:study_app/features/audios/data/firebase/audio_firebase_storage.dart';
import 'package:study_app/features/words/models/word.dart';
import 'package:study_app/features/words/models/word_topic_tile_item.dart';

import '../models/raw_word.dart';

class WordsRepositoryImpl {
  final AudioFirebaseStorage _audioStorage;
  final AudiosDbService _dbService;
  final RealtimeDatabaseService _realtimeDatabaseService;

  WordsRepositoryImpl({
    required AudioFirebaseStorage audioStorage,
    required AudiosDbService dbService,
    required RealtimeDatabaseService realtimeDatabaseService,
  })  : _audioStorage = audioStorage,
        _dbService = dbService,
        _realtimeDatabaseService = realtimeDatabaseService;

  List<WordTopicTileItem> loadAllWordTiles() {
    return <WordTopicTileItem>[
      // const WordTileItem(firstId: 1, lastId: 20, title: 'Lesson 1'),
    ];
  }

  void createWordWithAudio() async {
    final audio = await rootBundle.load('assets/words/audio/word_1.mp3').then((bytes) => bytes.buffer.asUint8List());
    /*const word = Word(
      word: 'Christmas',
      americanTranscription: '[ˈkrɪsməs]',
      britishTranscription: '[ˈkrɪsməs]',
      translation: 'Рождество',
    );*/
    // WordsDatabase.instance.createWord(word);
  }

  Future<List<Word>> readWord() async {
    // final word = await WordsDatabase.instance.readAllWords();
    // print(word);
    // return word;
    // await WordsDatabase.instance.clearAll();
    return [];
  }

  Future addImage() async {
    final imageData = await NetworkAssetBundle(Uri.parse('https://drive.google.com/uc'))
        .load('export=view&id=1enFrCA17boYga_Y5XvtPTz2XTxB-2W--');
    print(imageData.buffer.asUint8List());
    // final word = await WordsDatabase.instance.readWord(3);
    // final id = WordsDatabase.instance;
    // .update(word.copyWith(image: imageData.buffer.asUint8List()));
    // print('Item with ID $id was updated successfully');
  }

  List<WordTopicTileItem> loadBeginnerWordsTopics() {
    return const [
      WordTopicTileItem(
        title: 'Семья',
        topic: 'family',
        jsonPath: 'assets/words/topics/words_family.json',
        audiosPath: 'assets/words/audio/family/',
        picturesPath: 'assets/words/images/family/',
        iconPath: 'assets/icons/ic_family.svg',
      ),
      WordTopicTileItem(
        title: 'Рождение, свадьба, смерть',
        topic: 'birth_marriage_death',
        jsonPath: 'assets/words/topics/words_birth_marriage_death.json',
        audiosPath: 'assets/words/audio/birth_marriage_death/',
        picturesPath: 'assets/words/images/birth_marriage_death/',
        iconPath: 'assets/icons/birth_marriage_death.jpg',
      ),
    ];
  }

  List<WordTopicTileItem> loadIntermediateWordsTopics() {
    return const [
      WordTopicTileItem(
        title: 'Appearance, 1 part',
        topic: 'appearance_1_part',
        jsonPath: 'assets/words/levels/intermediate/words_appearance_1_part.json',
        audiosPath: 'assets/words/audio/family/',
        picturesPath: 'assets/words/images/family/',
        iconPath: 'assets/icons/ic_family.svg',
      ),
    ];
  }

  Future<List<Word>> getLocalWords({required String topic, required String onlyTopic}) async {
    final List<Word> words = [];
    final jsonWords = await rootBundle.loadString(topic /*'assets/words/topics/words_$topic.json'*/);
    print('$jsonWords');
    final rawWords = (json.decode(jsonWords) as List<dynamic>).map((e) => RawWord.fromJson(e)).toList();
    final topicDbAudios = await _dbService.getAudiosByTopic(onlyTopic);
    debugPrint('\$\$\$ getLocalWords -> topicDbAudios: $topicDbAudios');
    await _audioStorage.getAudios(topic: topic);
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
    // debugPrint('\$\$\$ _getAudioBytes -> dbAudio: $dbAudio');
    if (dbAudio != null) {
      return dbAudio.audio;
    } else {
      final audioFromFbStorage = await _audioStorage.getAudio(topic: topic, word: word);
      // debugPrint('\$\$\$ _getAudioBytes -> audioFromStorage: $audioFromFbStorage');
      if (audioFromFbStorage != null) {
        final entity = AudioEntity(name: word, topic: topic, audio: audioFromFbStorage);
        _dbService.insertItem(entity);
        return audioFromFbStorage;
      }
    }
    return null;
  }

  Future<int> loadTopicRating(String topic) async {
    RatingsHive hive = Get.put(RatingsHive());
    final connectivity = await (Connectivity().checkConnectivity());

    if (connectivity.firstOrNull == ConnectivityResult.mobile || connectivity.firstOrNull == ConnectivityResult.wifi) {
      final topicRating = await _realtimeDatabaseService.getTopicRating(topic);
      hive.saveUserRatingByTopic(topic, topicRating);
      return topicRating;
    } else {
      return await hive.getUserRatingByTopic(topic);
    }
  }
}
