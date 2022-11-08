import '../../../../../models/word_with_points.dart';

abstract class TrainingSuccessRepository {
  Future uploadRatings({
    required int points,
    required String training,
    required List<WordWithPoints> words,
  });
}
