import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/features/words/models/word.dart';

import '../bloc/collect_word_cubit.dart';

class CollectWordPage extends StatelessWidget {
  const CollectWordPage({
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
      create: (context) => CollectWordCubit(words, firstId, lastId),
      child: Scaffold(
        appBar: AppBar(
          title: Text('collect_word_title'.tr),
          actions: [
            BlocBuilder<CollectWordCubit, CollectWordState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 12),
                  child: Text('${state.id + 1}/${state.lastId + 1}'),
                );
              },
            ),
          ],
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ProgressMarks(),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<CollectWordCubit, CollectWordState>(
                builder: (context, state) {
                  return Image.asset(
                    state.words[state.id].image,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: BlocBuilder<CollectWordCubit, CollectWordState>(
                    builder: (context, state) {
                  return Text(
                    state.words[state.id].translation,
                    style: const TextStyle(fontSize: 32),
                    textAlign: TextAlign.center,
                  );
                }),
              ),
            ),
          const Expanded(
            flex: 3,
              child: Align(
                alignment: Alignment.bottomCenter,
            child: CollectWordComponent(),
          ))
        ]),
      ),
    );
  }
}

class ProgressMarks extends StatelessWidget {
  const ProgressMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectWordCubit, CollectWordState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: state.wordStates
              .map((e) => CircleMark(color: e.getAppropriateColor()))
              .toList(),
        );
      },
    );
  }
}

class CircleMark extends StatelessWidget {
  const CircleMark({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
    );
  }
}

class CollectWordComponent extends StatelessWidget {
  const CollectWordComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CollectWordCubit, CollectWordState>(
            buildWhen: (previous, current) =>
                previous.formedWord != current.formedWord,
            builder: (context, state) {
              return TextField(
                controller: TextEditingController(text: state.formedWord),
              );
            }),
        const SizedBox(
          height: 16,
        ),
        BlocBuilder<CollectWordCubit, CollectWordState>(
          buildWhen: (previous, current) => previous.id != current.id,
          builder: (context, state) {
            return CharactersPool(word: state.words[state.id].word);
          },
        ),
      ],
    );
  }
}

class CharactersPool extends StatelessWidget {
  const CharactersPool({Key? key, required this.word}) : super(key: key);

  final String word;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: shuffleCharacters(word)
          .map((e) => GestureDetector(
                onTap: () {
                  context.read<CollectWordCubit>().addNewCharacter(e);
                },
                child: Container(
                  width: 64,
                  height: 64,
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white38,
                  ),
                  child: Text(
                    e,
                    style: const TextStyle(
                      fontSize: 44,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ))
          .toList(),
    );
  }

  List<String> shuffleCharacters(String word) {
    List<String> characters = [];
    word.characters.forEach((element) {
      characters.add(element);
    });
    characters.shuffle();
    return characters;
  }
}
