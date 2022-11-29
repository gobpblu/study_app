import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:study_app/features/ratings/repository/ratings_repository.dart';
import 'package:study_app/features/ratings/repository/ratings_repository_impl.dart';

import '../models/user_rating.dart';

part 'ratings_state.dart';

class RatingsCubit extends Cubit<RatingsState> {
  RatingsCubit({required String topic})
      : super(RatingsState(
          usersRatings: const [],
          isLoading: true,
          topic: topic,
        )) {
    loadRatings();
  }

  final RatingsRepository _repository = Get.put(RatingsRepositoryImpl());

  Future loadRatings() async {
    emit(state.copyWith(isLoading: true));
    final userRatings =
        await _repository.loadAllTrainingsRatings(topic: state.topic);
    emit(state.copyWith(isLoading: false, usersRatings: userRatings));
  }
}
