import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/audios/data/db/audios_db_service.dart';
import 'package:study_app/features/audios/data/firebase/audio_firebase_storage.dart';

void initAudiosModule() {
  getIt.registerLazySingleton(() => AudiosDbService(lsDatabase: getIt()));
  getIt.registerLazySingleton(() => AudioFirebaseStorage());

}
