import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/levels/domain/models/level_data.dart';

import '../bloc/words_bloc.dart';
import '../tree/words_trainings/presentation/words_trainings_page.dart';
import 'widgets/words_category_tile.dart';

class WordsPage extends StatelessWidget {
  const WordsPage({Key? key, required this.level}) : super(key: key);

  final LevelEnum level;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WordsBloc>()..add(LoadAllWordsTopics(level: level)),
      child: Scaffold(
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
                        ));
                      }))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
