import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/features/words/tree/words_trainings_2/tree/collect_listened_word/bloc/collect_listened_word_cubit.dart';

class WordCharacters extends StatelessWidget {
  const WordCharacters({Key? key, required this.word}) : super(key: key);

  final List<String> word;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectListenedWordCubit, CollectListenedWordState>(
        builder: (context, state) {
      return Wrap(
        children: state.characters.entries
            .map(
              (e) => e.value > 0
                  ? SizedBox(
                      width: 80,
                      height: 80,
                      child: GestureDetector(
                        onTap: () => context
                            .read<CollectListenedWordCubit>()
                            .checkCharacter(e.key),
                        child: Card(
                          margin: EdgeInsets.all(16),
                          elevation: 10,
                          child: Text(
                            e.key,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 36),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: 80,
                      height: 80,
                    ),
            )
            .toList(),
      );
    });
  }
}
