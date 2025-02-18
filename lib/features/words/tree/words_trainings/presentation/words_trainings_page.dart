import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/ratings/presentation/ratings_page.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/choose_translation/bloc/choose_translation_cubit.dart';

import '../../../../ratings/bloc/ratings_cubit.dart';
import '../bloc/words_trainings_cubit.dart';
import '../tree/choose_translation/presentation/choose_translation_page.dart';
import '../tree/collect_listened_word/presentation/collect_listened_word_page.dart';
import '../tree/collect_word/bloc/collect_word_cubit.dart';
import '../tree/collect_word/presentation/collect_word_page.dart';
import '../tree/words_list/presentation/words_list_page.dart';

class WordsTrainingsPage extends StatelessWidget {
  const WordsTrainingsPage({
    Key? key,
    required this.title,
    required this.assetJsonName,
    required this.topic,
    required this.audioPath,
    required this.picturesPath,
  }) : super(key: key);

  final String title;
  final String assetJsonName;
  final String topic;
  final String audioPath;
  final String picturesPath;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordsTrainingsCubit(
        jsonAsset: assetJsonName,
        audioAssetPath: audioPath,
        picturesAssetPath: picturesPath,
        topic: topic,
      ),
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          toolbarHeight: 48,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<WordsTrainingsCubit, WordsTrainingsState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(WordsListPage(words: state.words));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: secondaryColor,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.format_list_numbered,
                              color: primaryTextColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _getWordsCount(state.words.length),
                              style: const TextStyle(
                                fontSize: 16,
                                color: primaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(BlocProvider(
                  create: (context) => RatingsCubit(topic: topic),
                  child: const RatingsPage(
                    title: 'Рейтинг по всем тренировкам',
                  ),
                ));
              },
              child: Container(
                margin: EdgeInsets.only(top: 12, right: 8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondaryColor,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/award.png',
                      height: 24,
                      color: primaryTextColor,
                    ),
                    const SizedBox(width: 4),
                    BlocBuilder<WordsTrainingsCubit, WordsTrainingsState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                            child: SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator()),
                          );
                        } else {
                          return Text(
                            state.rating.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: primaryTextColor,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Align(
                child: Text(title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              BlocBuilder<WordsTrainingsCubit, WordsTrainingsState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _TrainingCard(
                          title: 'Потренируй слух',
                          picture: const Icon(
                            Icons.headphones,
                            size: 108,
                          ),
                          onTap: () => Get.to(() => CollectListenedWordPage(
                              topic: topic, words: state.words..shuffle())),
                        ),
                        _TrainingCard(
                          picture: Image.asset(
                            'assets/images/word_collect.png',
                            color: onSurfaceTextColor,
                            fit: BoxFit.fitHeight,
                          ),
                          title: 'Собери слово',
                          onTap: () => Get.to(BlocProvider(
                            create: (context) =>
                                CollectWordCubit(state.words..shuffle()),
                            child: CollectWordPage(topic: topic),
                          )),
                        ),
                      ],
                    ),
                  );
                },
              ),
              BlocBuilder<WordsTrainingsCubit, WordsTrainingsState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _TrainingCard(
                          title: 'Выбери перевод',
                          picture: const Icon(
                            Icons.check_circle_outline_outlined,
                            size: 108,
                          ),
                          onTap: () => Get.to(
                                () => BlocProvider(
                                  create: (context) => ChooseTranslationCubit(
                                      topic: topic,
                                      words: state.words..shuffle()),
                                  child: ChooseTranslationPage(),
                                ),
                              )),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  String _getWordsCount(int count) {
    if (count ~/ 10 % 10 != 1 && count % 10 == 1) {
      return '$count слово';
    } else if (count ~/ 10 % 10 != 1 && count % 10 >= 2 && count % 10 <= 4) {
      return '$count слова';
    } else {
      return '$count слов';
    }
  }
}

class _TrainingCard extends StatelessWidget {
  const _TrainingCard({
    Key? key,
    required this.onTap,
    required this.title,
    required this.picture,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  final Widget picture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(12),
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
                color: cardBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: picture,
          ),
          Container(
            height: 44,
            width: 150,
            decoration: const BoxDecoration(
              color: onPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
