part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();
}

class SplashStatusChanged extends SplashEvent {
  final SplashStatus status;
  const SplashStatusChanged(this.status);
  @override
  List<Object> get props => [status];
}
