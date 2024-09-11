import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/words/models/word_with_points.dart';
import 'package:study_app/features/words/tree/words_trainings/domain/models/word_trainings_enum.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/training_success/domain/repository/training_success_repository.dart';

part 'training_success_state.dart';

class TrainingSuccessCubit extends Cubit<TrainingSuccessState> {
  TrainingSuccessCubit({
    required List<WordWithPoints> words,
    required TrainingSuccessRepository repository,
  })  : _repository = repository,
        super(TrainingSuccessState(
          words: words,
          rightWords: words.where((element) => element.isRight).toList().length,
        ));

  final TrainingSuccessRepository _repository;

  Future uploadRatings({
    required String topic,
    required int points,
    required WordTrainingsEnum training,
    required List<WordWithPoints> words,
  }) async {
    await _repository.uploadRatings(
      points: points,
      training: training.trainingName,
      words: words,
      topic: topic,
    );
  }
}
