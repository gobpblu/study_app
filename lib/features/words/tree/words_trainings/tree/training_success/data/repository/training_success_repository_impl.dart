import 'package:study_app/features/auth/domain/repository/user_local_repository.dart';
import 'package:study_app/features/ratings/db/ratings_hive.dart';
import 'package:study_app/features/realtime_database/service/realtime_database_service.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/training_success/domain/repository/training_success_repository.dart';

import '../../../../../../models/word_with_points.dart';

class TrainingSuccessRepositoryImpl extends TrainingSuccessRepository {
  final UserLocalRepository _userRepository;
  final RatingsHive _ratingsHive;

  TrainingSuccessRepositoryImpl({
    required UserLocalRepository userRepository,
    required RealtimeDatabaseService db,
    required RatingsHive ratingsHive,
  })  : _userRepository = userRepository,
        _ratingsHive = ratingsHive;

  @override
  Future uploadRatings({
    required String topic,
    required int points,
    required String training,
    required List<WordWithPoints> words,
  }) async {
    final user = _userRepository.getUser();
    if (user == null) return;
    await _ratingsHive.writeRatings(topic: topic, uid: user.uniqueId, points: points, words: words, training: training);
    final hiveResult = await _ratingsHive.getRatings();
    print('Hive Result: $hiveResult');
    /*final result = await db.writeRating(
      startIndex: 1,
      endIndex: 20,
      uid: user.uid,
      rating: points,
      training: training,
      words: words,
    );*/
    /*final result = await db.uploadRatingsFromLocal(map: hiveResult);
    if (result) {
      int count = await ratingsHive.clearWordsRatings();
      print('removed entries: $count');
    }
    print('uploadRatings result: $result');
    final overallRating = await db.writeOverallRating(user.uid, points);
    print('overall Rating: $overallRating');*/

    // final achievements = await db.writeAchievements(user.uid, currentGuessedWordsSeries)
  }
}
