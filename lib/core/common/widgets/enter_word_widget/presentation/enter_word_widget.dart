import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/words/tree/words_trainings_2/tree/collect_listened_word/bloc/collect_listened_word_cubit.dart';

class EnterWordWidget extends StatelessWidget {
  const EnterWordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectListenedWordCubit, CollectListenedWordState>(
      builder: (context, state) {
        return AnimatedContainer(
          height: 64,
          color: state.status == WordStatus.process
              ? enterWordsBackgroundColor
              : Colors.green,
          duration: const Duration(milliseconds: 500),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: state.formedWord
                .map((e) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
