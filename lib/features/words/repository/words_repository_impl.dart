import 'package:study_app/features/audios/data/db/audios_db_service.dart';
import 'package:study_app/features/audios/data/firebase/audio_firebase_storage.dart';
import 'package:study_app/features/realtime_database/service/realtime_database_service.dart';
import 'package:study_app/features/words/models/word_topic_tile_item.dart';

class WordsRepositoryImpl {

  WordsRepositoryImpl({
    required AudioFirebaseStorage audioStorage,
    required AudiosDbService dbService,
    required RealtimeDatabaseService realtimeDatabaseService,
  });

  List<WordTopicTileItem> loadAllWordTiles() {
    return <WordTopicTileItem>[
      // const WordTileItem(firstId: 1, lastId: 20, title: 'Lesson 1'),
    ];
  }

  List<WordTopicTileItem> loadBeginnerWordsTopics() {
    return const [
      WordTopicTileItem(
        title: 'Семья',
        topic: 'family',
        jsonPath: 'assets/words/topics/words_family.json',
        audiosPath: 'assets/words/audio/family/',
        picturesPath: 'assets/words/images/family/',
        iconPath: 'assets/icons/ic_family.svg',
      ),
      WordTopicTileItem(
        title: 'Рождение, свадьба, смерть',
        topic: 'birth_marriage_death',
        jsonPath: 'assets/words/topics/words_birth_marriage_death.json',
        audiosPath: 'assets/words/audio/birth_marriage_death/',
        picturesPath: 'assets/words/images/birth_marriage_death/',
        iconPath: 'assets/icons/birth_marriage_death.jpg',
      ),
    ];
  }

  List<WordTopicTileItem> loadIntermediateWordsTopics() {
    return const [
      WordTopicTileItem(
        title: 'Appearance, 1 part',
        topic: 'appearance_1_part',
        jsonPath: 'assets/words/levels/intermediate/words_appearance_1_part.json',
        audiosPath: 'assets/words/audio/family/',
        picturesPath: 'assets/words/images/family/',
        iconPath: 'assets/icons/ic_family.svg',
      ),
    ];
  }
}
