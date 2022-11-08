import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/words/tree/words_trainings_2/presentation/words_trainings_2_page.dart';

import '../tree/words_trainings_2/bloc/words_trainings_2_cubit.dart';
import 'widgets/words_category_tile.dart';

class WordsPage2 extends StatelessWidget {
  const WordsPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            WordsCategoryTile(
              onTap: () =>
                  Get.to(BlocProvider(
                      create: (context) => WordsTrainings2Cubit('assets/words/numbers_1-20.json'),
                      child: WordsTrainings2Page(
                      title: 'Цифры 1-20',
                    assetJsonName: 'assets/words/numbers_1-20.json',
                  )
                  ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
