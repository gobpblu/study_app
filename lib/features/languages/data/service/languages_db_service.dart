import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:study_app/features/languages/domain/language_type.dart';

const languageKey = 'language';

class LanguagesDbService {
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  Future<bool> saveUserLanguage(LanguageType language, String uid) async {
    final userUrl = 'users/$uid';
    final userRef = _db.ref(userUrl);
    TransactionResult result = await userRef.runTransaction((Object? currentUser) {
      Map<String, dynamic> userMap;
      if (currentUser == null) {
        userMap = {languageKey: language.name};
      } else {
        userMap = Map<String, dynamic>.from(currentUser as Map);
        userMap[languageKey] = language.name;
      }
      return Transaction.success(userMap);
    });
    debugPrint('For user with id $uid saved language: ${language.name}\n'
        '\nSnapshot value is:${result.snapshot.value}');
    return result.committed;
  }
}
