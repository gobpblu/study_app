import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/common/widgets/audio_visualizer/audio_visualizer.dart';
import 'package:study_app/core/common/widgets/audio_visualizer/off_audio_visualizer.dart';
import 'package:study_app/core/common/widgets/enter_word_widget/presentation/enter_word_widget.dart';
import 'package:study_app/core/common/widgets/word_card/presentation/word_characters.dart';
import 'package:study_app/core/res/app_colors.dart';

import '../../../../../models/word.dart';
import '../../../models/word_status_enum.dart';
import '../../training_success/presentation/training_success_page.dart';
import '../bloc/collect_listened_word_cubit.dart';

class CollectListenedWordPage extends StatelessWidget {
  const CollectListenedWordPage({
    Key? key,
    required this.topic,
    required this.words,
  }) : super(key: key);

  final String topic;
  final List<Word> words;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CollectListenedWordCubit(words)..playAudio(0),
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            title:
                BlocBuilder<CollectListenedWordCubit, CollectListenedWordState>(
              buildWhen: (previous, current) => previous.index != current.index,
              builder: (context, state) {
                return Text('${state.index + 1}/10');
              },
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocListener<CollectListenedWordCubit,
                    CollectListenedWordState>(
                  listener: (context, state) {
                    if (state.status == WordStatus.lastSuccess) {
                      Get.to(TrainingSuccessPage(
                        points: state.points,
                        wordsWithPoints: state.wordsWithPoints,
                        topic: topic,
                      ));
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.grade),
                      BlocBuilder<CollectListenedWordCubit,
                          CollectListenedWordState>(builder: (context, state) {
                        return Text(
                          state.points.toString(),
                          style: const TextStyle(
                            color: primaryTextColor,
                            fontSize: 14,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 64),
                BlocBuilder<CollectListenedWordCubit, CollectListenedWordState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          context.read<CollectListenedWordCubit>().playAudio(state.index);
                        },
                        icon: const Icon(Icons.play_arrow));
                  },
                ),
                BlocBuilder<CollectListenedWordCubit, CollectListenedWordState>(
                  buildWhen: (previous, current) =>
                      previous.shouldAnimate != current.shouldAnimate,
                  builder: (context, state) {
                    return SizedBox(
                      height: 84,
                      child: state.shouldAnimate
                          ? AudioVisualizer(shouldAnimate: state.shouldAnimate)
                          : const OffAudioVisualizer(),
                    );
                  },
                ),
                const SizedBox(height: 80),
                BlocBuilder<CollectListenedWordCubit, CollectListenedWordState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status ||
                      previous.formedWord != current.formedWord,
                  builder: (context, state) {
                    return EnterWordWidget(
                      status: state.status,
                      formedWord: state.formedWord,
                    );
                  },
                ),
                const SizedBox(height: 80),
                BlocBuilder<CollectListenedWordCubit, CollectListenedWordState>(
                  buildWhen: (previous, current) =>
                      previous.characters != current.characters ||
                      previous.formedWord != current.formedWord,
                  builder: (context, state) {
                    return WordCharacters(
                      word: state.formedWord,
                      characters: state.characters,
                      onTap: (character, index) => context
                          .read<CollectListenedWordCubit>()
                          .checkCharacter(character, index),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
