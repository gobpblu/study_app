part of 'texts_bloc.dart';

abstract class TextsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTexts extends TextsEvent {}
