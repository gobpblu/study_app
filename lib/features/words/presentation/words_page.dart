import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/res/app_colors.dart';

import '../bloc/words_bloc.dart';
import '../tree/words_trainings/presentation/words_trainings_page.dart';
import 'widgets/words_category_tile.dart';

class WordsPage extends StatelessWidget {
  const WordsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(),
      body: BlocBuilder<WordsBloc, WordsState>(
        builder: (context, state) {
          return ListView(
            children: state.items
                .map((e) => WordTopicTile(
                    iconAsset: e.iconPath,
                    title: e.title,
                    onTap: () {
                      Get.to(WordsTrainingsPage(
                        topic: e.topic,
                        title: e.title,
                        assetJsonName: e.jsonPath,
                        audioPath: e.audiosPath,
                        picturesPath: e.picturesPath,
                      ));
                    }))
                .toList(),
          );
        },
      ),
    );
  }
}
