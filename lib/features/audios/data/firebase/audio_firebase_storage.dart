import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class AudioFirebaseStorage {
  final _storageRef = FirebaseStorage.instance.ref();

  Future<Uint8List?> getAudio({required String topic, required String word}) async {
    debugPrint('\$\$\$ AudioFirebaseStorage -> getAudio -> START, topic: $topic, word: $word');
    final audioRef = _storageRef.child('words/audio/$topic/$word.mp3');
    try {
      final Uint8List? data = await audioRef.getData();
      debugPrint('\$\$\$ AudioFirebaseStorage -> getAudio -> SUCCESS, topic: $topic, word: $word, data != null: ${data != null}');
      return data;
    } on FirebaseException catch (e) {
      debugPrint('\$\$\$ AudioFirebaseStorage -> getAudio -> error: $e');
      return null;
    }
  }


  Future getAudios({required String topic}) async {
    final topicAudios = await _storageRef.child('words/audio/$topic').list();
    debugPrint('\$\$\$ AudioFirebaseStorage -> getAudios -> data.size: ${topicAudios.items}');
    for(var ref in topicAudios.items) {
      final data = await ref.getData();
      debugPrint('\$\$\$ AudioFirebaseStorage -> getAudios -> data.size: ${data?.length}');
    }
    // final audioRef = _storageRef.child('words/audio/$topic/$word.mp3');
  }

}