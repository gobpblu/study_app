import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/ratings/domain/repository/ratings_repository.dart';

import '../models/user_rating.dart';

part 'ratings_state.dart';

class RatingsCubit extends Cubit<RatingsState> {
  RatingsCubit({
    required RatingsRepository repository,
  })  : _repository = repository,
        super(const RatingsState(
          usersRatings: [],
          isLoading: true,
        ));

  final RatingsRepository _repository;

  Future loadRatings(String topic) async {
    emit(state.copyWith(isLoading: true));
    final userRatings = await _repository.loadAllTrainingsRatings(topic: topic);
    emit(state.copyWith(isLoading: false, usersRatings: userRatings));
  }
}
