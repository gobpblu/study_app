import 'package:sqflite/sqflite.dart';
import 'package:study_app/core/data/db/language_study_database.dart';
import 'package:study_app/features/audios/models/audio_model.dart';

class AudiosDbService {
  static const tableName = "audios";
  static const columnName = "name";
  static const columnTopic = "topic";
  static const columnAudio = "audio";

  final LanguageStudyDatabase _lsDatabase;

  AudiosDbService({required LanguageStudyDatabase lsDatabase}) : _lsDatabase = lsDatabase;

  Future<int> insertItem(AudioEntity entity) async {
    final database = await _lsDatabase.database;
    return database.insert(tableName, entity.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<AudioEntity>> getAudiosByTopic(String topic) async {
    final db = await _lsDatabase.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'topic = ?',
      whereArgs: [topic],
    );
    return maps.map((e) => AudioEntity.fromJson(e)).toList();
  }

  Future<AudioEntity?> getAudioByName(String name) async {
    final db = await _lsDatabase.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName, where: 'name = ?', whereArgs: [name]);
    return maps.isNotEmpty ? AudioEntity.fromJson(maps[0]) : null;
  }
}
