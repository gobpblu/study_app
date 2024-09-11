import 'package:study_app/features/words/models/word.dart';

abstract class WordsTrainingsRepository {
  Future<List<Word>> getLocalWords({required String topic, required String onlyTopic});

  Future<int> loadTopicRating(String topic);
}
