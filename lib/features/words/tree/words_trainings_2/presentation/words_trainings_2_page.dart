import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/words/tree/words_trainings_2/bloc/words_trainings_2_cubit.dart';

import '../tree/collect_listened_word/bloc/collect_listened_word_cubit.dart';
import '../tree/collect_listened_word/presentation/collect_listened_word_page.dart';

class WordsTrainings2Page extends StatelessWidget {
  const WordsTrainings2Page({
    Key? key,
    required this.title,
    required this.assetJsonName,
  }) : super(key: key);

  final String title;
  final String assetJsonName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 48,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.stacked_bar_chart,
                color: primaryTextColor,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '0/400',
                style: const TextStyle(
                  fontSize: 16,
                  color: primaryTextColor,
                ),
              ),
            ],
          ),
        ),
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
            BlocBuilder<WordsTrainings2Cubit, WordsTrainings2State>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      _TrainingCard(
                        onTap: () => Get.to(BlocProvider(
                          create: (context) =>
                              CollectListenedWordCubit(state.words..shuffle())
                                ..playAudio(),
                          child: CollectListenedWordPage(),
                        )),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TrainingCard extends StatelessWidget {
  const _TrainingCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: cardBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            // child: Image.asset('assets/images/training_card_listening.png'),
            /*decoration: BoxDecoration(
              color: cardBackgroundColor,
              image: DecorationImage(
                  image: AssetImage('assets/images/training_card_listening.svg'),
                colorFilter: ColorFilter.mode(cardBackgroundColor, BlendMode.dstATop),
                // invertColors: true,
              ),
            ),*/
            child: Icon(
              Icons.headphones,
              size: 108,
            ),
          ),
          Container(
            height: 44,
            width: 150,
            decoration: BoxDecoration(
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
                  'Тренируем слух',
                  textAlign: TextAlign.center,
                )),
                Icon(Icons.stacked_bar_chart),
                Text('1000'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
