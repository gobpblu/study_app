import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/ratings/presentation/ratings_page.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/choose_translation/presentation/bloc/choose_translation_cubit.dart';
import 'package:study_app/features/words/tree/words_trainings/tree/collect_word/presentation/bloc/collect_word_cubit.dart';

import '../../../../ratings/bloc/ratings_cubit.dart';
import '../bloc/words_trainings_cubit.dart';
import '../tree/choose_translation/presentation/choose_translation_page.dart';
import '../tree/collect_listened_word/presentation/collect_listened_word_page.dart';
import '../tree/collect_word/presentation/collect_word_page.dart';
import '../tree/words_list/presentation/words_list_page.dart';

class WordsTrainingsPage extends StatelessWidget {
  const WordsTrainingsPage({
    Key? key,
    required this.title,
    required this.assetJsonName,
    required this.topic,
  }) : super(key: key);

  final String title;
  final String assetJsonName;
  final String topic;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WordsTrainingsCubit>()
        ..loadWords(jsonAsset: assetJsonName, topic: topic)
        ..loadRating(topic: topic),
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
                  create: (context) => getIt<RatingsCubit>()
                  ..loadRatings(topic),
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
                            child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator()),
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
        body: _Body(title: title, topic: topic),
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

class _Body extends StatelessWidget {
  const _Body({
    super.key,
    required this.title,
    required this.topic,
  });

  final String title;
  final String topic;

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((WordsTrainingsCubit cubit) => cubit.state.isLoading);
    final loadingText = context.select((WordsTrainingsCubit cubit) => cubit.state.loadingText);
    if (isLoading) {
      return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const Text('Идёт загрузка слов...'),
              Text(loadingText),
            ],
          ),
      );
    }
    return SingleChildScrollView(
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
                      onTap: () => Get.to(() => CollectListenedWordPage(topic: topic, words: state.words..shuffle())),
                    ),
                    _TrainingCard(
                      picture: Image.asset(
                        'assets/images/word_collect.png',
                        color: onSurfaceTextColor,
                        fit: BoxFit.fitHeight,
                      ),
                      title: 'Собери слово',
                      onTap: () => Get.to(BlocProvider(
                        create: (context) => getIt.get<CollectWordCubit>(param1: state.words..shuffle()),
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
                              create: (context) => getIt.get<ChooseTranslationCubit>(
                                param1: topic,
                                param2: state.words..shuffle(),
                              ),
                              child: ChooseTranslationPage(),
                            ),
                          )),
                ],
              );
            },
          )
        ],
      ),
    );
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
