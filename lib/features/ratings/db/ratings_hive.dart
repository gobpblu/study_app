import 'package:hive/hive.dart';

import '../../words/models/word_with_points.dart';

class RatingsHive {
  Future writeRatings({
    required int startIndex,
    required int endIndex,
    required String uid,
    required int points,
    required List<WordWithPoints> words,
    required String training,
  }) async {
    await Hive.openBox('wordsRatings');
    var box = Hive.box('wordsRatings');
    final wordsMap = box.toMap();
    print('box: ${box.toMap()}');
    if (wordsMap['$startIndex-$endIndex'] == null) {
      wordsMap['overall_rating'] = (wordsMap['overall_rating'] ?? 0) + points;
      wordsMap['$startIndex-$endIndex'] =
          _generateTopicWordsMap(words, training, points);
    } else {
      final topicWords = _updateTopicWords(
        wordsMap['$startIndex-$endIndex'],
        words,
        training,
        points,
      );
      wordsMap['overall_rating'] = (wordsMap['overall_rating'] ?? 0) + points;
      wordsMap['$startIndex-$endIndex'] = topicWords;
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
      topicWordsMap['${word.id}'] = {
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
      map['${word.id}'] = {
        'points': (map['${word.id}']?['points'] ?? 0) + word.points,
        'correct_answers': (map['${word.id}']?['correct_answers'] ?? 0) +
            (word.isRight ? 1 : 0),
        'wrong_answers':
            (map['${word.id}']?['wrong_answers'] ?? 0) + (word.isRight ? 0 : 1),
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
}
