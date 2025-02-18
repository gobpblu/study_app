import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:study_app/features/audios/models/audio_model.dart';
import 'package:study_app/features/words/models/raw_word.dart';
import 'package:study_app/features/words/tree/words_trainings/domain/repository/words_training_repository.dart';

import '../../../models/word.dart';

part 'words_trainings_state.dart';

class WordsTrainingsCubit extends Cubit<WordsTrainingsState> {
  WordsTrainingsCubit({
    required WordsTrainingsRepository wordsRepository,
  })  : _repository = wordsRepository,
        super(const WordsTrainingsState(
          isLoading: true,
          words: [],
          rating: 0,
          loadingText: '',
        ));

  final WordsTrainingsRepository _repository;

  Future loadWords({required String jsonAsset, required String topic}) async {
    emit(state.copyWith(isLoading: true));
    final rawWords = await _repository.getRawWords(topic: jsonAsset);
    final topicDbAudios = await _repository.getDbAudios(topic: topic);
    print('topicDbAudios: ${topicDbAudios.map((e) => e.name).toList()}');
    if (topicDbAudios.isEmpty) {
    final futureAudioMap = await _repository.getStorageAudios(topic: topic) ?? {};
      _loadAudiosFromStorage(
        rawWords: rawWords,
        futureAudioMap: futureAudioMap,
        topicDbAudios: topicDbAudios,
        topic: topic,
      );
    } else {
      _loadAudiosFromDb(
        rawWords: rawWords,
        topicDbAudios: topicDbAudios,
        topic: topic,
      );
    }
  }

  Future loadRating({required String topic}) async {
    final rating = await _repository.loadTopicRating(topic);
    emit(state.copyWith(rating: rating));
  }

  void _loadAudiosFromStorage({
    required List<RawWord> rawWords,
    required Map<String, Future<Uint8List?>> futureAudioMap,
    required List<AudioEntity> topicDbAudios,
    required String topic,
  }) async {
    final List<Word> words = [];
    for (var i = 0; i < rawWords.length; i++) {
      emit(state.copyWith(loadingText: '${i + 1}/${rawWords.length}'));
      final item = rawWords[i];
      final word = Word(
        word: item.word,
        transcription: item.transcription,
        translation: item.translation,
        // image: 'assets/words/images/$topic/${item.word}.jpg',
        audio: _repository.getAudio(word: item.word, topic: topic),
        audioBytes: await _getAudioBytes(topicDbAudios, futureAudioMap, item.word, topic),
      );
      words.add(word);
    }
    emit(state.copyWith(words: words, isLoading: false));
  }

  void _loadAudiosFromDb({
    required List<RawWord> rawWords,
    required List<AudioEntity> topicDbAudios,
    required String topic,
  }) async {
    final List<Word> words = [];
    for (var i = 0; i < rawWords.length; i++) {
      emit(state.copyWith(loadingText: '${i + 1}/${rawWords.length}'));
      final item = rawWords[i];
      final word = Word(
        word: item.word,
        transcription: item.transcription,
        translation: item.translation,
        // image: 'assets/words/images/$topic/${item.word}.jpg',
        audio: _repository.getAudio(word: item.word, topic: topic),
        audioBytes: await _getAudioFromDb(topicDbAudios, item.word),
      );
      words.add(word);
    }
    emit(state.copyWith(words: words, isLoading: false));
  }

  Future<Uint8List?> _getAudioBytes(
    List<AudioEntity> dbAudios,
    Map<String, Future<Uint8List?>> futureAudioMap,
    String word,
    String topic,
  ) async {
    final dbAudio = dbAudios.firstWhereOrNull((element) => element.name == word);
    if (dbAudio != null) {
      return dbAudio.audio;
    } else {
      final audioFromFbStorage = await futureAudioMap[word];
      if (audioFromFbStorage != null) {
        final entity = AudioEntity(name: word, topic: topic, audio: audioFromFbStorage);
        await _repository.saveAudio(audio: entity);
        return audioFromFbStorage;
      }
    }
    return null;
  }

  Future<Uint8List?> _getAudioFromDb(
    List<AudioEntity> dbAudios,
    String word,
  ) async {
    final dbAudio = dbAudios.firstWhereOrNull((element) => element.name == word);
    return dbAudio?.audio;
  }

  Future<List<Uint8List>> getAudiosFromStorage() async {
    return [];
  }
}
