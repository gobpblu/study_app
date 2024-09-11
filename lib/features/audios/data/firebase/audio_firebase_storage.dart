import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class AudioFirebaseStorage {
  final _storageRef = FirebaseStorage.instance.ref();

  Future<Uint8List?> getAudio({required String topic, required String word}) async {
    final audioRef = _storageRef.child('words/audio/$topic/$word.mp3');
    try {
      final Uint8List? data = await audioRef.getData();
      return data;
    } on FirebaseException catch (e) {
      debugPrint('\$\$\$ AudioFirebaseStorage -> getAudio -> error: $e');
      return null;
    }
  }

}