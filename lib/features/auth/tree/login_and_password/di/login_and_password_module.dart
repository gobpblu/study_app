import 'package:study_app/core/di/dependency_injection.dart';
import 'package:study_app/features/auth/tree/login_and_password/presentation/bloc/login_and_password_bloc.dart';

void initLoginAndPasswordModule() {

  getIt.registerFactory(() => LoginAndPasswordBloc());

}