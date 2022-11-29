import 'package:equatable/equatable.dart';

class PickedWord extends Equatable {
  final int index;
  final bool isRight;

  const PickedWord({
    required this.index,
    required this.isRight,
});

  @override
  List<Object?> get props => [index, isRight];

}