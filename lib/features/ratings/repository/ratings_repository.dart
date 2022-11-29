import '../models/user_rating.dart';

abstract class RatingsRepository {
  Future<List<UserRating>> loadAllTrainingsRatings({required String topic});
}