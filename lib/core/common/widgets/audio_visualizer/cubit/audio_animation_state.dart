part of 'audio_animation_cubit.dart';

enum AudioAnimationStatus { on, off }

class AudioAnimationState extends Equatable {
  final AudioAnimationStatus status;

  const AudioAnimationState({required this.status});

  AudioAnimationState copyWith({
  AudioAnimationStatus? status,
}) => AudioAnimationState(status: status ?? this.status);

  @override
  List<Object?> get props => [status];
}