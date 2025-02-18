part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({
    required this.status ,
});

  final SplashStatus status;

  SplashState copyWith({
    SplashStatus? status,
}) {
    return SplashState(
      status: status ?? this.status,
    );
}

  @override
  List<Object> get props => [status];
}