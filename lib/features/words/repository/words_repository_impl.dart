import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:study_app/features/words/models/word.dart';
import 'package:study_app/features/words/models/word_tile_item.dart';

import '../models/raw_word.dart';

class WordsRepositoryImpl {
  Future<List<Word>> loadWords(int firstId, int lastId) async {
    final List<Word> words = [];
    final jsonWords =
        await rootBundle.loadString('assets/words/words_$firstId-$lastId.json');
    final rawWords = (json.decode(jsonWords) as List<dynamic>)
        .map((e) => RawWord.fromJson(e))
        .toList();
    for (var item in rawWords) {
      final word = Word(
        id: item.id,
        word: item.word,
        americanTranscription: item.americanTranscription,
        britishTranscription: item.britishTranscription,
        translation: item.translation,
        image: 'assets/words/images/word_${item.id}.jpg',
        americanAudio: 'words/audio/word_${item.id}_american.mp3',
        britishAudio: 'words/audio/word_${item.id}_british.mp3',
      );
      words.add(word);
    }
    return words;
  }

  List<WordTileItem> loadAllWordTiles() {
    return <WordTileItem>[
      const WordTileItem(firstId: 1, lastId: 20, title: 'Lesson 1'),
    ];
  }

  void createWordWithAudio() async {
    final audio = await rootBundle
        .load('assets/words/audio/word_1.mp3')
        .then((bytes) => bytes.buffer.asUint8List());
    /*const word = Word(
      word: 'Christmas',
      americanTranscription: '[ˈkrɪsməs]',
      britishTranscription: '[ˈkrɪsməs]',
      translation: 'Рождество',
    );*/
    // WordsDatabase.instance.createWord(word);
  }

  Future<List<Word>> readWord() async {
    // final word = await WordsDatabase.instance.readAllWords();
    // print(word);
    // return word;
    // await WordsDatabase.instance.clearAll();
    return [];
  }

  Future addImage() async {
    final imageData =
        await NetworkAssetBundle(Uri.parse('https://drive.google.com/uc'))
            .load('export=view&id=1enFrCA17boYga_Y5XvtPTz2XTxB-2W--');
    print(imageData.buffer.asUint8List());
    // final word = await WordsDatabase.instance.readWord(3);
    // final id = WordsDatabase.instance;
    // .update(word.copyWith(image: imageData.buffer.asUint8List()));
    // print('Item with ID $id was updated successfully');
  }
}
