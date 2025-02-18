import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/languages/data/repository/languages_local_repository_impl.dart';
import 'package:study_app/features/languages/data/repository/languages_remote_repository_impl.dart';
import 'package:study_app/features/languages/data/service/languages_db_service.dart';
import 'package:study_app/features/languages/domain/languages_interactor.dart';
import 'package:study_app/features/languages/domain/repository/languages_local_repository.dart';
import 'package:study_app/features/languages/domain/repository/languages_remote_repository.dart';
import 'package:study_app/features/languages/presentation/bloc/languages_cubit.dart';

void initLanguagesModule() {
  getIt.registerLazySingleton(() => LanguagesDbService());
  getIt.registerLazySingleton<LanguagesRemoteRepository>(() => LanguagesRemoteRepositoryImpl(dbService: getIt()));
  getIt.registerLazySingleton<LanguagesLocalRepository>(() => LanguagesLocalRepositoryImpl());
  getIt.registerLazySingleton(() => LanguagesInteractor(
        remoteRepository: getIt(),
        userLocalRepository: getIt(),
        localRepository: getIt(),
      ));
  getIt.registerFactory(() => LanguagesCubit(languagesInteractor: getIt()));
}
