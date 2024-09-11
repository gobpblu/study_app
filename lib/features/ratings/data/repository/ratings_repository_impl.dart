import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:study_app/features/ratings/models/user_rating.dart';
import 'package:study_app/features/realtime_database/service/realtime_database_service.dart';

import '../../db/ratings_hive.dart';
import '../../domain/repository/ratings_repository.dart';

class RatingsRepositoryImpl extends RatingsRepository {
  final RealtimeDatabaseService _db;
  final RatingsHive _hive;

  RatingsRepositoryImpl({
    required RealtimeDatabaseService db,
    required RatingsHive hive,
  })  : _db = db,
        _hive = hive;

  @override
  Future<List<UserRating>> loadAllTrainingsRatings({required String topic}) async {
    await _uploadRatingsToDb();
    final userRatings = await _db.loadAllTrainingsRatings(topic);
    userRatings.sort((a, b) => b.points - a.points);
    return userRatings;
  }

  Future _uploadRatingsToDb() async {
    final ratings = await _hive.getRatings();
    if (ratings.isNotEmpty) {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult[0] == ConnectivityResult.wifi || connectivityResult[0] == ConnectivityResult.mobile) {
        final result = await _db.uploadRatingsFromLocal(map: ratings);
        if (result) {
          int count = await _hive.clearWordsRatings();
          debugPrint('removed entries: $count');
        }
      }
    } else {
      return [];
    }
  }
}
