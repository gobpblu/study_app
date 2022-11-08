import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_animation_state.dart';

class AudioAnimationCubit extends Cubit<AudioAnimationState> {
  AudioAnimationCubit()
      : super(AudioAnimationState(status: AudioAnimationStatus.on));

  void turnOn() => emit(state.copyWith(status: AudioAnimationStatus.on));

  void turnOff() => emit(state.copyWith(status: AudioAnimationStatus.off));
}
