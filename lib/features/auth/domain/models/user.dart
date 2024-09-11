import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String uniqueId;

  const User({
    required this.name,
    required this.uniqueId,
  });

  @override
  List<Object?> get props => [name, uniqueId];
}
