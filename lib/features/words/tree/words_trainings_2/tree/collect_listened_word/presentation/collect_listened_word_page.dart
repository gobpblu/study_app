import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/common/widgets/audio_visualizer/audio_visualizer.dart';
import 'package:study_app/core/common/widgets/audio_visualizer/off_audio_visualizer.dart';
import 'package:study_app/core/common/widgets/enter_word_widget/presentation/enter_word_widget.dart';
import 'package:study_app/core/common/widgets/word_card/presentation/word_characters.dart';
import 'package:study_app/core/res/app_colors.dart';

import '../../training_success/bloc/training_success_cubit.dart';
import '../../training_success/presentation/training_success_page.dart';
import '../bloc/collect_listened_word_cubit.dart';

class CollectListenedWordPage extends StatelessWidget {
  const CollectListenedWordPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CollectListenedWordCubit, CollectListenedWordState>(
      listener: (context, state) {
        if (state.status == WordStatus.lastSuccess) {
          Get.to(BlocProvider(
            create: (context) => TrainingSuccessCubit(
              points: state.points,
              training: 'collect_listened_word',
              words: state.wordsWithPoints,
            )..uploadRatings(),
            child: TrainingSuccessPage(),
          ));
        }
      },
      builder: (context, state) {
        return BlocBuilder<CollectListenedWordCubit, CollectListenedWordState>(
            builder: (context, state) {
          print(state);
          return Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              title: BlocBuilder<CollectListenedWordCubit,
                  CollectListenedWordState>(
                buildWhen: (previous, current) =>
                    previous.index != current.index,
                builder: (context, state) {
                  return Text('${state.index + 1}/10');
                },
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.grade),
                      BlocBuilder<CollectListenedWordCubit,
                          CollectListenedWordState>(builder: (context, state) {
                        return Text(
                          state.points.toString(),
                          style: TextStyle(
                            color: primaryTextColor,
                            fontSize: 14,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 108),
                  BlocBuilder<CollectListenedWordCubit,
                      CollectListenedWordState>(
                    buildWhen: (previous, current) =>
                        previous.shouldAnimate != current.shouldAnimate,
                    builder: (context, state) {
                      return SizedBox(
                        height: 84,
                        child: state.shouldAnimate
                            ? AudioVisualizer(
                                shouldAnimate: state.shouldAnimate)
                            : const OffAudioVisualizer(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const EnterWordWidget(),
                  const SizedBox(
                    height: 80,
                  ),
                  WordCharacters(word: state.formedWord),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
