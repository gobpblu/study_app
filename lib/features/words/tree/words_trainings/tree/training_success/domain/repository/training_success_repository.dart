import 'package:study_app/features/words/models/word_with_points.dart';

abstract class TrainingSuccessRepository {
  Future uploadRatings({
    required String topic,
    required int points,
    required String training,
    required List<WordWithPoints> words,
  });
}
