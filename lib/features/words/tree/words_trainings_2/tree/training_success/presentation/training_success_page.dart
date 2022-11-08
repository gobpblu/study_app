import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/res/app_colors.dart';

import '../bloc/training_success_cubit.dart';

class TrainingSuccessPage extends StatelessWidget {
  const TrainingSuccessPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      persistentFooterButtons: [
        ElevatedButton(
            onPressed: () {
              Get.close(2);
            },
            child: Text('Продолжить')),
      ],
      appBar: AppBar(
        title: Text('Результат'),
        centerTitle: true,
      ),
      body: BlocBuilder<TrainingSuccessCubit, TrainingSuccessState>(
        builder: (context, state) {
          return Column(
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
                    state.points.toString(),
                    style: TextStyle(fontSize: 72),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                  heightFactor: 4.2,
                  alignment: Alignment.center,
                  child: Text(
                    getPointsText(state.points),
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
      ),
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
