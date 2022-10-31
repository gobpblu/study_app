import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:study_app/features/texts/repository/texts_repository.dart';

import '../models/text.dart';

class TextsRepositoryImpl extends TextsRepository {
  @override
  Future<List<EnglishText>> loadTexts() async {
    final db = FirebaseFirestore.instance;
    final ref = db
        .collection('texts');
    final docSnap = await ref.get();
    final texts = docSnap.docs.map((e) => EnglishText.fromJson(e.data())).toList();
    return texts;
  }

  @override
  Future<List<EnglishText>> loadTextsFromLocal(int count) async {
    final List<EnglishText> texts = [];
    for (var i = 1; i <= count; i++) {
      final jsonText = await rootBundle.loadString(
          'assets/texts/text_$i.json');
      print(jsonText);
      final text = EnglishText.fromJson(
          json.decode(jsonText) as Map<String, dynamic>);
      texts.add(text);
    }
    return texts;
  }
}
