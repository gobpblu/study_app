import 'package:get/get.dart';
import 'package:study_app/features/ratings/db/ratings_hive.dart';
import 'package:study_app/features/realtime_database/service/realtime_database_service.dart';
import 'package:study_app/features/user/repository/user_local_repository.dart';
import 'package:study_app/features/user/repository/user_local_repository_impl.dart';

import '../../../../../models/word_with_points.dart';
import 'training_success_repository.dart';

class TrainingSuccessRepositoryImpl extends TrainingSuccessRepository {
  final UserLocalRepository userRepository = Get.put(UserLocalRepositoryImpl());
  final db = Get.put(RealtimeDatabaseService());
  final ratingsHive = Get.put(RatingsHive());

  @override
  Future uploadRatings({
    required String topic,
    required int points,
    required String training,
    required List<WordWithPoints> words,
  }) async {
    final user = userRepository.getUser();
    await ratingsHive.writeRatings(
        topic: topic,
        uid: user.uid,
        points: points,
        words: words,
        training: training);
    final hiveResult = await ratingsHive.getRatings();
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
