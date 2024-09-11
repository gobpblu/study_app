import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/features/auth/domain/auth_interactor.dart';
import 'package:study_app/features/auth/domain/models/user.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required AuthInteractor authInteractor,
  })  : _authInteractor = authInteractor,
        super(const ProfileState(user: null));

  final AuthInteractor _authInteractor;

  Future<void> getUser() async {
    final user = _authInteractor.getCurrentUser();
    emit(ProfileState(user: user));
  }

  Future<void> logout() async {
    await _authInteractor.logout();
  }
}
