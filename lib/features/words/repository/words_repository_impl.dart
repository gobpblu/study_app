import 'package:study_app/features/audios/data/db/audios_db_service.dart';
import 'package:study_app/features/audios/data/firebase/audio_firebase_storage.dart';
import 'package:study_app/features/realtime_database/service/realtime_database_service.dart';
import 'package:study_app/features/words/models/word_topic_tile_item.dart';
import 'package:study_app/generated/l10n.dart';

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
    return [
      WordTopicTileItem(
        title: S.current.words_beginner_countries_and_nationalities,
        topic: 'countries_and_nationalities',
        jsonPath: 'assets/words/languages/english/levels/beginner/countries_and_nationalities.json',
        iconPath: 'assets/icons/countries_and_nationalities.svg',
      ),
      // WordTopicTileItem(
      //   title: 'Семья',
      //   topic: 'family',
      //   jsonPath: 'assets/words/topics/words_family.json',
      //   iconPath: 'assets/icons/ic_family.svg',
      // ),
      // WordTopicTileItem(
      //   title: 'Рождение, свадьба, смерть',
      //   topic: 'birth_marriage_death',
      //   jsonPath: 'assets/words/topics/words_birth_marriage_death.json',
      //   iconPath: 'assets/icons/birth_marriage_death.jpg',
      // ),
    ];
  }

  List<WordTopicTileItem> loadIntermediateWordsTopics() {
    return const [
      WordTopicTileItem(
        title: 'Appearance, 1 part',
        topic: 'appearance_1_part',
        jsonPath: 'assets/words/languages/english/levels/intermediate/words_appearance_1_part.json',
        iconPath: 'assets/icons/ic_appearance_1_part.svg',
      ),
      WordTopicTileItem(
        title: 'Face and hair',
        topic: 'face_and_hair',
        jsonPath: 'assets/words/languages/english/levels/intermediate/face_and_hair.json',
        iconPath: 'assets/icons/ic_face_and_hair.svg',
      ),
    ];
  }
}
