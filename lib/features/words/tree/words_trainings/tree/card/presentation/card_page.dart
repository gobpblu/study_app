import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/core/res/styles/text_styles.dart';
import 'package:study_app/features/words/models/word.dart';

import '../bloc/card_cubit.dart';

class CardPage extends StatelessWidget {
  const CardPage({
    Key? key,
    required this.words,
    required this.firstId,
    required this.lastId,
  }) : super(key: key);

  final int firstId;
  final int lastId;
  final List<Word> words;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardCubit(words, firstId, lastId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Карточки', style: appBarTitleTextStyle),
          actions: [
            BlocBuilder<CardCubit, CardState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 12),
                  child: Text('${state.id + 1}/${state.lastId + 1}'),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<CardCubit, CardState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 16),
                Image.asset(
                  state.words[state.id].image,
                  height: 200,
                ),
                const SizedBox(height: 16),
                Text(
                  state.words[state.id].word,
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(thickness: 0.5),
                const SizedBox(height: 16),
                Text(
                  state.words[state.id].translation,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 28, fontFamily: 'Times New Roman'),
                ),
                const SizedBox(height: 16),
                const Divider(thickness: 0.5),
                const SizedBox(height: 16),
                const _LanguageLabel(language: 'American'),
                const SizedBox(height: 16),
                Text(
                  state.words[state.id].americanTranscription,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Cambria',
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<CardCubit>().playAmericanAudio();
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 48,
                  ),
                  iconSize: 48,
                ),
                const _NextAndPreviousButtons(),
                const _LanguageLabel(language: 'British'),
                const SizedBox(height: 16),
                Text(
                  state.words[state.id].britishTranscription,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Cambria',
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<CardCubit>().playBritishAudio();
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 48,
                  ),
                  iconSize: 48,
                ),
              ]),
            );
          },
        ),
      ),
    );
  }
}

class _NextAndPreviousButtons extends StatelessWidget {
  const _NextAndPreviousButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          iconSize: 48,
          onPressed: () {
            context.read<CardCubit>().showPreviousWord();
          },
          icon: const Icon(Icons.keyboard_arrow_left, size: 48),
        ),
        const Expanded(child: Divider(thickness: 0.5)),
        IconButton(
          iconSize: 48,
          onPressed: () {
            context.read<CardCubit>().showNextWord();
          },
          icon: const Icon(Icons.keyboard_arrow_right, size: 48),
        ),
      ],
    );
  }
}

class _LanguageLabel extends StatelessWidget {
  const _LanguageLabel({Key? key, required this.language}) : super(key: key);

  final String language;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Text(
        language,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
