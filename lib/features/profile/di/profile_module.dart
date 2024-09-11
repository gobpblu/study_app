import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/profile/presentation/cubit/profile_cubit.dart';

void initProfileModule() {

  getIt.registerFactory(() => ProfileCubit(authInteractor: getIt()));

}