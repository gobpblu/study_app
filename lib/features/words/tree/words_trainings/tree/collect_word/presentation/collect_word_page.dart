import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/common/widgets/enter_word_widget/presentation/enter_word_widget.dart';
import 'package:study_app/core/common/widgets/word_card/presentation/word_characters.dart';
import 'package:study_app/core/res/app_colors.dart';

import '../../../models/word_status_enum.dart';
import '../../training_success/presentation/training_success_page.dart';
import '../bloc/collect_word_cubit.dart';

class CollectWordPage extends StatelessWidget {
  const CollectWordPage({
    Key? key,
    required this.topic,
  }) : super(key: key);

  final String topic;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CollectWordCubit, CollectWordState>(
      listener: (context, state) {
        if (state.status == WordStatus.lastSuccess) {
          Get.to(TrainingSuccessPage(
            points: state.points,
            wordsWithPoints: state.wordsWithPoints,
            topic: topic,
          ));
        }
      },
      child: BlocBuilder<CollectWordCubit, CollectWordState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              title: Text('${state.index + 1}/10'),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.grade),
                      Text(
                        state.points.toString(),
                        style: const TextStyle(
                          color: primaryTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(

              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*Container(
                    height: 250,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(state.currentWord.image),
                  ),*/
                  Text(
                    state.currentWord.translation,
                    style: const TextStyle(fontSize: 36),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  EnterWordWidget(status: state.status, formedWord: state.formedWord),
                  const SizedBox(height: 80),
                  WordCharacters(
                    word: state.formedWord,
                    characters: state.characters,
                    onTap: (character, index) => context.read<CollectWordCubit>().checkCharacter(character, index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
