import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/auth/data/repository/auth_remote_repository_impl.dart';
import 'package:study_app/features/auth/data/repository/user_local_repository_impl.dart';
import 'package:study_app/features/auth/data/service/auth_firebase_service.dart';
import 'package:study_app/features/auth/domain/auth_interactor.dart';
import 'package:study_app/features/auth/domain/repository/auth_remote_repository.dart';
import 'package:study_app/features/auth/domain/repository/user_local_repository.dart';

void initAuthModule() {

  getIt.registerLazySingleton(() => AuthFirebaseService());

  getIt.registerLazySingleton<AuthRemoteRepository>(() => AuthRemoteRepositoryImpl(authFirebaseService: getIt()));
  getIt.registerLazySingleton<UserLocalRepository>(() => UserLocalRepositoryImpl());

  getIt.registerFactory(() => AuthInteractor(remoteRepository: getIt(), userLocalRepository: getIt()));
}
