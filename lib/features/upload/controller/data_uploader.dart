import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseDataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  void uploadData() async {
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    /*final words = manifestMap.keys
        .where(
            (path) => path.startsWith('assets/words') && path.contains('.json'))
        .toList();
    final wordsToLoad =
        await rootBundle.loadString(words.first);*/
    final words = json.decode(await DefaultAssetBundle.of(Get.context!)
        .loadString('assets/words/words_1-10.json')) as Map<String, dynamic>;
    print(words);
    final db = FirebaseFirestore.instance;
    db.collection('words').add(words).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
