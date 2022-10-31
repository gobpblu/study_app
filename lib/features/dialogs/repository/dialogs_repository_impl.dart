import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../models/english_dialog.dart';
import 'dialogs_repository.dart';

class DialogsRepositoryImpl extends DialogsRepository {
  @override
  Future<List<EnglishDialog>> loadDialogs() async {
    final db = FirebaseFirestore.instance;
    final ref = db.collection('dialogs');
    final docSnap = await ref.get();
    final texts = docSnap.docs.map((e) => EnglishDialog.fromJson(e.data()))
        .toList();
    return texts;
  }

  @override
  Future<List<EnglishDialog>> loadDialogsFromLocal(int count) async {
    final List<EnglishDialog> dialogs = [];
    for (var i = 1; i <= count; i++) {
      print(i);
      final jsonDialog = await rootBundle.loadString(
          'assets/dialogs/dialog_$i.json');
      print('jsonDialog: $jsonDialog');
      final dialog = EnglishDialog.fromJson(json.decode(jsonDialog)
      as Map<String, dynamic>);
      print('dialog: $dialog');
      dialogs.add(dialog);
      print('I work');
    }
    print(dialogs);
    return dialogs;
  }
}
