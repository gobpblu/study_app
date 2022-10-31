part of 'texts_bloc.dart';

enum TextsStatus { initial, success, failure }

class TextsState extends Equatable {
  const TextsState({required this.status, this.texts});

  final TextsStatus status;
  final List<EnglishText>? texts;

  @override
  List<Object?> get props => [texts];

  TextsState copyWith({
    TextsStatus? status,
    List<EnglishText>? texts,
  }) {
    return TextsState(
      status: status ?? this.status,
      texts: texts ?? this.texts,
    );
  }
}
