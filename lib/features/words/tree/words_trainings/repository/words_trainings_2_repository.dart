import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:study_app/features/words/models/word2.dart';

class WordsTrainings2Repository {
  Future<List<Word2>> loadWords(String asset) async {
    final jsonWords = await rootBundle.loadString(asset);
    final words = (json.decode(jsonWords) as List<dynamic>)
        .map((e) => Word2.fromJson(e))
        .toList();
    print('words: $words');
    return words;
  }
}
