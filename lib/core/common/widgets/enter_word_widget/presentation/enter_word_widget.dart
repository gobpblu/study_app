import 'package:flutter/material.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/words/tree/words_trainings/domain/models/word_status_enum.dart';

class EnterWordWidget extends StatelessWidget {
  const EnterWordWidget({
    Key? key,
    required this.status,
    required this.formedWord,
  }) : super(key: key);

  final WordStatus status;
  final List<String> formedWord;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12),
      color: status == WordStatus.process
          ? enterWordsBackgroundColor
          : Colors.green,
      duration: const Duration(milliseconds: 500),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: formedWord
            .map((e) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    e,
                    style: const TextStyle(fontSize: 24),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
