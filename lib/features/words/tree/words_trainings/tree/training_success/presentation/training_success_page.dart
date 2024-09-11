import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/words/models/word_with_points.dart';
import 'package:study_app/features/words/tree/words_trainings/domain/models/word_trainings_enum.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/training_success/presentation/bloc/training_success_cubit.dart';

class TrainingSuccessPage extends StatelessWidget {
  const TrainingSuccessPage({
    Key? key,
    required this.points,
    required this.wordsWithPoints,
    required this.topic,
    required this.wordTrainingsEnum,
  }) : super(key: key);

  final int points;
  final List<WordWithPoints> wordsWithPoints;
  final String topic;
  final WordTrainingsEnum wordTrainingsEnum;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<TrainingSuccessCubit>(param1: wordsWithPoints)
        ..uploadRatings(
          topic: topic,
          points: points,
          training: wordTrainingsEnum,
          words: wordsWithPoints,
        ),
      child: Scaffold(
          extendBody: true,
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 48),
                    alignment: Alignment.center,
                  ),
                  onPressed: () {
                    Get.close(2);
                  },
                  child: Text('Продолжить')),
            ),
          ],
          appBar: AppBar(
            title: Text('Результат'),
            centerTitle: true,
          ),
          body: BlocBuilder<TrainingSuccessCubit, TrainingSuccessState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: Get.width,
                      width: double.infinity,
                      child: CircularProgressIndicator(
                        backgroundColor: primaryColor,
                        value: state.rightWords / state.words.length,
                        strokeWidth: 10,
                      ),
                    ),
                    Align(
                      heightFactor: 2,
                      alignment: Alignment.center,
                      child: Text(
                        points.toString(),
                        style: TextStyle(fontSize: 72),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      heightFactor: 4.5,
                      alignment: Alignment.center,
                      child: Text(
                        getPointsText(points),
                        style: TextStyle(fontSize: 48),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      heightFactor: 6,
                      alignment: Alignment.center,
                      child: Text(
                        '${state.rightWords}/${state.words.length}',
                        style: TextStyle(fontSize: 64),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                ],
              );
            },
          )),
    );
  }

  String getPointsText(int points) {
    int units = points % 10;
    int dozens = points ~/ 10 % 10;
    if (dozens != 1 && units == 1) {
      return 'ОЧКО';
    } else if (dozens != 1 && (units == 2 || units == 3 || units == 4)) {
      return 'ОЧКА';
    } else {
      return 'ОЧКОВ';
    }
  }
}
