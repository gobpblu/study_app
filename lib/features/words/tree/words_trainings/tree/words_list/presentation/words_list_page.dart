import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:study_app/core/res/app_colors.dart';
import 'package:study_app/features/words/models/word.dart';

class WordsListPage extends StatelessWidget {
  WordsListPage({Key? key, required this.words}) : super(key: key);

  final List<Word> words;
  final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Список слов'),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 8, top: 4, bottom: 4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: secondaryTextColor,
              ),
              child: Text(
                words.length.toString(),
                style: const TextStyle(color: primaryTextColor),
              ),
            )
          ],
        ),
        body: ListView(
          children: words
              .map((e) => ListTile(
                    title: Text(
                      e.word,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(e.translation,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal)),
                    trailing: IconButton(
                      onPressed: () {
                        final audioBytes = e.audioBytes;
                        if (audioBytes != null ) {
                          player.play(BytesSource(audioBytes));
                        } else {
                          player.play(AssetSource(e.audio));
                        }
                      },
                      icon: const Icon(Icons.play_arrow),
                    ),

                  ))
              .toList(),
        ));
  }
}
