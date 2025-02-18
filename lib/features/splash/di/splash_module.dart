import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/splash/presentation/bloc/splash_bloc.dart';

void initSplashModule() {
  getIt.registerFactory(() => SplashBloc(authInteractor: getIt()));
}