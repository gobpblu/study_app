import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../bloc/words_trainings_cubit.dart';
import '../tree/card/presentation/card_page.dart';
import '../tree/collect_word/presentation/collect_word_page.dart';

class WordsTrainingsPage extends StatelessWidget {
  const WordsTrainingsPage({
    Key? key,
    required this.firstId,
    required this.lastId,
  }) : super(key: key);

  final int firstId;
  final int lastId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordsTrainingsCubit(firstId, lastId),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.format_list_numbered),
                  Text('${lastId - firstId + 1} words'),
                  // Text(getAppropriateText(lastItemId - firstItemId + 1)),
                ],
              ),
            )
          ],
        ),
        body: BlocBuilder<WordsTrainingsCubit, WordsTrainingsState>(
            builder: (context, state) {
          if (state.isLoading) {
            return const CircularProgressIndicator();
          } else {
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 24,
              children: const [
                const _GridCards(cardTitle: 'Карточки'),
                const _GridTrainingCards(cardTitle: 'Собери слово'),
              ],
            );
          }
        }),
      ),
    );
  }

  String getAppropriateText(int count) {
    final units = count % 10;
    final dozens = count / 10 % 10;
    if (dozens != 1 && units == 1) {
      return '$count слово';
    } else if (dozens != 1 && units >= 2 && units <= 4) {
      return '$count слова';
    } else {
      return '$count слов';
    }
  }
}

class _GridCards extends StatelessWidget {
  const _GridCards({Key? key, required this.cardTitle, this.cardColor})
      : super(key: key);

  final String cardTitle;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordsTrainingsCubit, WordsTrainingsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Get.to(CardPage(
              words: state.words,
              firstId: state.firstId,
              lastId: state.lastId,
            ));
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 192,
              height: 180,
              child: Card(
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: cardColor ?? Colors.grey[800],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _RectangleWithLines(
                        cardColor: cardColor ?? Colors.grey[700]!),
                    const SizedBox(height: 8),
                    _RectangleWithLines(
                        cardColor: cardColor ?? Colors.grey[700]!),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      cardTitle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _GridTrainingCards extends StatelessWidget {
  const _GridTrainingCards({Key? key, required this.cardTitle})
      : super(key: key);

  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordsTrainingsCubit, WordsTrainingsState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () {
          Get.to(CollectWordPage(
            words: state.words,
            firstId: state.firstId,
            lastId: state.lastId,
          ));
        },
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 192,
            height: 180,
            child: Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.grey[800],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  _RectangleWithLines(cardColor: Colors.grey[700]!),
                  const SizedBox(height: 8),
                  _RectangleWithoutLines(cardColor: Colors.grey[700]!),
                  const SizedBox(height: 16),
                  Text(
                    cardTitle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _RectangleWithLines extends StatelessWidget {
  const _RectangleWithLines({Key? key, required this.cardColor})
      : super(key: key);
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      color: Colors.white,
      child: Column(
        children: [
          _RectangleLine(cardColor: cardColor),
          const SizedBox(height: 4),
          _RectangleLine(cardColor: cardColor),
          const SizedBox(height: 4),
          _RectangleLine(cardColor: cardColor),
        ],
      ),
    );
  }
}

class _RectangleLine extends StatelessWidget {
  const _RectangleLine({Key? key, required this.cardColor}) : super(key: key);
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 54,
      color: cardColor,
    );
  }
}

class _RectangleWithoutLines extends StatelessWidget {
  const _RectangleWithoutLines({Key? key, required this.cardColor})
      : super(key: key);
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 28,
      width: 62,
      color: Colors.white,
    );
  }
}
