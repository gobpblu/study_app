import 'package:equatable/equatable.dart';

class WordTileItem extends Equatable {
  final int firstId;
  final int lastId;
  final String title;

  const WordTileItem({
    required this.firstId,
    required this.lastId,
    required this.title,
  });

  @override
  List<Object?> get props => [firstId, lastId, title];
}
