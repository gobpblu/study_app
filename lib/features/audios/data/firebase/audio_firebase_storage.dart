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
      debugPrint('\$\$\$ AudioFirebaseStorage -> getAudio: $word -> error: $e');
      return null;
    }
  }

  Future<Map<String, Future<Uint8List?>>?> getAudios({required String topic}) async {
    final audioRef = _storageRef.child('words/audio/$topic');
    final Map<String, Future<Uint8List?>> futureAudioList = {};
    try {
      final ListResult data = await audioRef.listAll();
      for (var element in data.items) {
        final data = element.getData();
        print('element.name: ${element.name}');
        final name = element.name.replaceAll(".mp3", "");
        print('name: $name');
        futureAudioList[name] = data;
      }

      return futureAudioList;
    } on FirebaseException catch (e) {
      debugPrint('\$\$\$ AudioFirebaseStorage -> getAudio: $topic -> error: $e');
      return null;
    }
  }
}
