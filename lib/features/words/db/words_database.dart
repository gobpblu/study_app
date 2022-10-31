/*
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:study_app/features/words/models/word.dart';

class WordsDatabase {
  static final WordsDatabase instance = WordsDatabase._init();

  static const tableWords = 'words';

  static Database? _database;

  WordsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('words.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    print('i work');
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const audioType = 'BLOB NOT NULL';
    const imageType = 'BLOB';

    await db.execute('''
    CREATE TABLE $tableWords (
    ${WordField.id} $idType,
    ${WordField.word} $textType,
    ${WordField.transcription} $textType,
    ${WordField.translation} $textType,
    ${WordField.audio} $audioType,
    ${WordField.image} $imageType
    )
''');
    print('DB was created!');
  }

  Future deleteTableAndRecreate() async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const audioType = 'BLOB NOT NULL';
    const imageType = 'BLOB';
    // final db = await instance.database;
    // final id = await db.delete(tableWords);
    // print('Table deleted $id');
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'words');

    Database db = await openDatabase(path, version: 1, onCreate: _createDB);
    await db.execute("DROP TABLE IF EXISTS words");
    await db.execute('''
    CREATE TABLE $tableWords (
    ${WordField.id} $idType,
    ${WordField.word} $textType,
    ${WordField.transcription} $textType,
    ${WordField.translation} $textType,
    ${WordField.audio} $audioType,
    ${WordField.image} $imageType
    )
''');
  }

  Future createWord(Word word) async {
    final db = await instance.database;
    final id = await db.insert(tableWords, word.toJson());
    print('Inserted successfully! Last inserted id is $id');
  }
  
  Future createWords(List<Word> words) async {
    final db = await instance.database;
    for (var word in words) {
      final id = await db.insert(tableWords, word.toJson());
      print('Inserted successfully! Last inserted id is $id');
    }
  }

  Future<Word> readWord(int id) async {
    final db = await instance.database;

    final maps = await db.query(tableWords,
        columns: WordField.values,
        where: '${WordField.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      print(maps);
      return Word.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not found');
    }
  }

  Future<List<Word>> readAllWords() async {
    final db = await instance.database;
    const orderBy = '${WordField.id} ASC';
    // final result = await db.rawQuery('SELECT * FROM $tableWords ORDER BY $orderBy');
    final result = await db.query(tableWords, orderBy: orderBy);
    print(result);
    // return result.map((e) => Word.fromJson(e)).toList();
    return [];
  }

  Future clearAll() async {
    final db = await instance.database.then((value) => value.setVersion(2));
    print('db was versioned up');
  }

  Future<int> update(Word word) async {
    final db = await instance.database;

    return db.update(
      tableWords,
      word.toJson(),
      where: '${WordField.id} = ?',
      whereArgs: [word.id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
*/
