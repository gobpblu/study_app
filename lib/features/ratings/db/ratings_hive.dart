import 'package:hive/hive.dart';

import '../../words/models/word_with_points.dart';

class RatingsHive {
  Future writeRatings({
    required String topic,
    required String uid,
    required int points,
    required List<WordWithPoints> words,
    required String training,
  }) async {
    await Hive.openBox('wordsRatings');
    var box = Hive.box('wordsRatings');
    final wordsMap = box.toMap();
    if (wordsMap[topic] == null) {
      wordsMap['overall_rating'] = (wordsMap['overall_rating'] ?? 0) + points;
      wordsMap[topic] = _generateTopicWordsMap(words, training, points);
    } else {
      final topicWords = _updateTopicWords(
        wordsMap[topic],
        words,
        training,
        points,
      );
      wordsMap['overall_rating'] = (wordsMap['overall_rating'] ?? 0) + points;
      wordsMap[topic] = topicWords;
    }
    box.putAll(wordsMap);
  }

  Future<Map<dynamic, dynamic>> getRatings() async {
    final box = await Hive.openBox('wordsRatings');
    return box.toMap();
  }

  Map<String, dynamic> _generateTopicWordsMap(
      List<WordWithPoints> words, String training, int points) {
    final Map<String, dynamic> topicWordsMap = {};
    int correctAnswers = 0;
    int wrongAnswers = 0;
    for (var word in words) {
      word.isRight ? correctAnswers++ : wrongAnswers++;
      topicWordsMap[word.word] = {
        'points': word.points,
        'correct_answers': word.isRight ? 1 : 0,
        'wrong_answers': word.isRight ? 0 : 1,
      };
    }
    topicWordsMap[training] = points;
    topicWordsMap['common_rating'] = points;
    topicWordsMap['correct_answers'] = correctAnswers;
    topicWordsMap['wrong_answers'] = wrongAnswers;
    return topicWordsMap;
  }

  Map<dynamic, dynamic> _updateTopicWords(
    Map<dynamic, dynamic> map,
    List<WordWithPoints> words,
    String training,
    int points,
  ) {
    int correctAnswers = 0;
    int wrongAnswers = 0;
    for (var word in words) {
      word.isRight ? correctAnswers++ : wrongAnswers++;
      map[word.word] = {
        'points': (map[word.word]?['points'] ?? 0) + word.points,
        'correct_answers': (map[word.word]?['correct_answers'] ?? 0) +
            (word.isRight ? 1 : 0),
        'wrong_answers':
            (map[word.word]?['wrong_answers'] ?? 0) + (word.isRight ? 0 : 1),
      };
    }
    map[training] = (map[training] ?? 0) + points;
    map['common_rating'] = (map['common_rating'] ?? 0) + points;
    map['correct_answers'] = (map['correct_answers'] ?? 0) + correctAnswers;
    map['wrong_answers'] = (map['wrong_answers'] ?? 0) + wrongAnswers;
    return map;
  }

  Future<int> clearWordsRatings() async {
    final box = await Hive.openBox('wordsRatings');
    final count = box.clear();
    return count;
  }

  Future saveUserRatingByTopic(String topic, int rating) async {
    final box = await Hive.openBox('userRating');
    final map = box.toMap();
    map[topic]?['rating'] = (map[topic]?['rating'] ?? 0) + rating;
    box.putAll(map);
  }

  Future getUserRatingByTopic(String topic) async {
    final box = await Hive.openBox('userRating');
    final map = box.toMap();
    return map[topic]?['rating'] ?? 0;
  }
}
