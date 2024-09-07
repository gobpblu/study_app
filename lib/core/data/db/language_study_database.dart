import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:study_app/features/audios/data/db/audios_db_service.dart';

class LanguageStudyDatabase {
  static const _databaseName = "language_study.db";
  static const _databaseVersion = 1;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, _databaseName);

    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: _databaseVersion,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    debugPrint('\#\#\# _onCreate');
    await db.execute('''
    CREATE TABLE ${AudiosDbService.tableName}(${AudiosDbService.columnName} TEXT PRIMARY KEY, ${AudiosDbService.columnTopic} TEXT, ${AudiosDbService.columnAudio} BLOB)
    ''');
  }
}
