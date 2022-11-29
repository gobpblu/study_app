part of 'words_bloc.dart';

abstract class WordsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddImage extends WordsEvent {
  final Uint8List image;

  AddImage(this.image);

  @override
  List<Object?> get props => [image];
}

class LoadAllWords extends WordsEvent {}

class LoadParticularWords extends WordsEvent {
  final int firstId;
  final int lastId;

  LoadParticularWords({required this.firstId, required this.lastId});

  @override
  List<Object?> get props => [firstId, lastId];
}

class LoadAllWordsTopics extends WordsEvent {}