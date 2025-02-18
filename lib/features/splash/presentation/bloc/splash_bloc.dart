import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/auth/domain/auth_interactor.dart';
import 'package:study_app/features/splash/presentation/models/splash_status.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required AuthInteractor authInteractor,
  })  : _authInteractor = authInteractor,
        super(const SplashState(status: SplashStatus.loading)) {
    on<SplashStatusChanged>(_onSplashStatusChanged);
  }

  final AuthInteractor _authInteractor;

  void _onAuthStatusSubscribed() {
    // _authInteractor.observeRemoteAuthState().listen((user) {
    //   if (user == null) {
    //     add()
    //   }
    //   if (eve.hasData) {
    //     print('I work');
    //     if (user != null ) {
    //       userRepository.saveUser(snapshot.data!);
    //     }
    //     print(snapshot.data);
    //     if (snapshot.data?.displayName?.isEmpty ?? true) {
    //       return BlocProvider(
    //         create: (context) => AuthBloc(),
    //         child: DisplayNamePage(user: snapshot.data),
    //       );
    //     }
    //     return const HomePage();
    //   } else {
    //     return const LoginPage();
    //   }
    // });
  }

  void _onSplashStatusChanged(
      SplashStatusChanged event,
      Emitter<SplashState> emit,
      ) {
    emit(state.copyWith(status: event.status));
  }
}
