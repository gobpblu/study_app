part of 'words_bloc.dart';

enum WordsStatus { initial, success, failure }

class WordsState extends Equatable {
  final WordsStatus status;
  final bool isLoading;
  final Uint8List? image;
  final List<WordTileItem> items;

  const WordsState({required this.status, required this.isLoading, this.image, required this.items});

  WordsState copyWith({
    WordsStatus? status,
    bool? isLoading,
    Uint8List? image,
    List<WordTileItem>? items,
  }) =>
      WordsState(
        status: status ?? this.status,
        isLoading: isLoading ?? this.isLoading,
        image: image ?? this.image,
        items: items ?? this.items,
      );

  @override
  List<Object?> get props => [status, isLoading, image, items];
}
