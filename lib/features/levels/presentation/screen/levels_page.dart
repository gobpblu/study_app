import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/levels/domain/models/level_enum.dart';
import 'package:study_app/features/words/presentation/words_page.dart';
import 'package:study_app/generated/l10n.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const levels = LevelEnum.values;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).levels_title),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final level = levels[index];
          return _LevelItem(level: level);
        },
        itemCount: levels.length,
      ),
    );
  }
}

class _LevelItem extends StatelessWidget {
  const _LevelItem({required this.level});

  final LevelEnum level;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(WordsPage(level: level));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        padding: const EdgeInsets.all(4),
        height: 60,
        decoration: BoxDecoration(
          color: onPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          level.title,
          softWrap: true,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
