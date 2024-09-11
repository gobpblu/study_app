import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/ratings/bloc/ratings_cubit.dart';
import 'package:study_app/features/ratings/data/repository/ratings_repository_impl.dart';
import 'package:study_app/features/ratings/db/ratings_hive.dart';
import 'package:study_app/features/ratings/domain/repository/ratings_repository.dart';

void initRatingsModule() {

  getIt.registerLazySingleton(() => RatingsHive());

  getIt.registerLazySingleton<RatingsRepository>(() => RatingsRepositoryImpl(db: getIt(), hive: getIt()));

  getIt.registerFactory(() => RatingsCubit(repository: getIt()));

}