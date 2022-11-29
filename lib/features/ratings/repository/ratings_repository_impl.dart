import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:study_app/features/ratings/models/user_rating.dart';
import 'package:study_app/features/realtime_database/service/realtime_database_service.dart';
import 'package:study_app/features/user/repository/user_local_repository.dart';
import 'package:study_app/features/user/repository/user_local_repository_impl.dart';

import '../db/ratings_hive.dart';
import 'ratings_repository.dart';

class RatingsRepositoryImpl extends RatingsRepository {
  final db = Get.put(RealtimeDatabaseService());
  final hive = Get.put(RatingsHive());
  final UserLocalRepository userRepository = Get.put(UserLocalRepositoryImpl());

  @override
  Future<List<UserRating>> loadAllTrainingsRatings({required String topic}) async {
    await _uploadRatingsToDb();
    final userRatings = await db.loadAllTrainingsRatings(topic);
    userRatings.sort((a, b) => b.points - a.points);
    return userRatings;
  }

  Future _uploadRatingsToDb() async {
    final ratings = await hive.getRatings();
    print('Ratings: $ratings');
    if (ratings.isNotEmpty) {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        final result = await db.uploadRatingsFromLocal(map: ratings);
        if (result) {
          int count = await hive.clearWordsRatings();
          print('removed entries: $count');
        }
        print('uploadRatings result: $result');
      }
    } else {
      return [];
    }
    final user = userRepository.getUser();

    // final overallRating = await db.writeOverallRating(user.uid, points);
    // print('overall Rating: $overallRating');

    // final achievements = await db.writeAchievements(user.uid, currentGuessedWordsSeries)
  }

  Future _loadAllTrainingsRating() async {

  }
}
