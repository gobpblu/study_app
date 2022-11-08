import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/words/models/word_with_points.dart';

import '../repository/training_success_repository.dart';
import '../repository/training_success_repository_impl.dart';

part 'training_success_state.dart';

class TrainingSuccessCubit extends Cubit<TrainingSuccessState> {
  TrainingSuccessCubit({
    required int points,
    required String training,
    required List<WordWithPoints> words,
  }) : super(TrainingSuccessState(
            points: points,
            training: training,
            words: words,
            rightWords:
                words.where((element) => element.isRight).toList().length));

  final TrainingSuccessRepository repository = TrainingSuccessRepositoryImpl();

  Future uploadRatings() async {
    await repository.uploadRatings(
        points: state.points, training: state.training, words: state.words);
  }
}
