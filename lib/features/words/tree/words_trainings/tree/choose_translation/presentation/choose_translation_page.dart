import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/words/models/word.dart';
import 'package:study_app/features/words/tree/words_trainings/domain/models/word_trainings_enum.dart';

import '../../../../../models/word_state.dart';
import '../../training_success/presentation/training_success_page.dart';
import 'bloc/choose_translation_cubit.dart';

class ChooseTranslationPage extends StatelessWidget {
  const ChooseTranslationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChooseTranslationCubit, ChooseTranslationState>(
      listener: (context, state) {
        if (state.status == ChooseTranslationStatus.lastSuccess) {
          Get.to(TrainingSuccessPage(
            points: state.points,
            wordsWithPoints: state.wordsWithPoints,
            topic: state.topic,
            wordTrainingsEnum: WordTrainingsEnum.chooseTranslation,
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Выбери перевод'),
          bottom: const _AppBarBottom(),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.grade),
                  BlocBuilder<ChooseTranslationCubit, ChooseTranslationState>(
                    builder: (context, state) {
                      return Text(
                        state.points.toString(),
                        style: const TextStyle(
                          color: primaryTextColor,
                          fontSize: 14,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        body: _ChooseTranslationBody(),
      ),
    );
  }
}

class _AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseTranslationCubit, ChooseTranslationState>(
        buildWhen: (previous, current) => previous.wordsWithPoints != current.wordsWithPoints,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              10,
              (index) {
                if (index >= state.wordsWithPoints.length) {
                  /*Get.to(TrainingSuccessPage(points: state.points,
                      wordsWithPoints: state.wordsWithPoints,
                      topic: state.topic));*/
                  return const CircleMark(wordState: WordStateEnum.neutral);
                } else {
                  return CircleMark(
                      wordState: state.wordsWithPoints[index].isRight ? WordStateEnum.done : WordStateEnum.mistake);
                }
              },
            ),
          );
        });
  }

  @override
  Size get preferredSize => Size(24, 24);
}

class _ChooseTranslationBody extends StatelessWidget {
  const _ChooseTranslationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          BlocBuilder<ChooseTranslationCubit, ChooseTranslationState>(
            buildWhen: (previous, current) => previous.currentWord != current.currentWord,
            builder: (context, state) {
              return Align(
                alignment: Alignment.center,
                child: Text(
                  state.currentWord.translation,
                  style: const TextStyle(fontSize: 36),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
          const SizedBox(height: 108),
          BlocBuilder<ChooseTranslationCubit, ChooseTranslationState>(
            buildWhen: (previous, current) => previous.wordsOnScreen != current.wordsOnScreen,
            builder: (context, state) {
              return VariantCards(words: state.wordsOnScreen..shuffle());
            },
          ),
        ],
      ),
    );
  }
}

class CircleMark extends StatelessWidget {
  const CircleMark({
    Key? key,
    required this.wordState,
  }) : super(key: key);

  final WordStateEnum wordState;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: wordState.getAppropriateColor(),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class VariantCards extends StatelessWidget {
  const VariantCards({Key? key, required this.words}) : super(key: key);

  final List<Word> words;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Expanded(child: CardWord(word: words[0].word, index: 0)),
            Expanded(child: CardWord(word: words[1].word, index: 1)),
          ],
        ),
        Row(
          children: [
            Expanded(child: CardWord(word: words[2].word, index: 2)),
            Expanded(child: CardWord(word: words[3].word, index: 3)),
          ],
        ),
        Row(
          children: [
            Expanded(child: CardWord(word: words[4].word, index: 4)),
            Expanded(child: CardWord(word: words[5].word, index: 5))
          ],
        ),
      ],
    );
  }
}

class CardWord extends StatelessWidget {
  const CardWord({Key? key, required this.word, required this.index}) : super(key: key);

  final String word;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ChooseTranslationCubit>().chooseWord(word, index);
      },
      child: BlocBuilder<ChooseTranslationCubit, ChooseTranslationState>(
        buildWhen: (previous, current) => previous.pickedWord != current.pickedWord,
        builder: (context, state) {
          return Container(
            height: 96,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: state.pickedWord.index == index
                  ? state.pickedWord.isRight
                      ? Colors.green
                      : Colors.red
                  : state.pickedWord.index != -1 && state.currentWord.word == word
                      ? Colors.green
                      : secondaryTextColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  word,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )),
          );
        },
      ),
    );
  }
}
