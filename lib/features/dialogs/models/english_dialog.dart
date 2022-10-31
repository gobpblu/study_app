import 'package:equatable/equatable.dart';

class EnglishDialog extends Equatable {
  const EnglishDialog({required this.name, required this.content});

  final String name;
  final String content;

  factory EnglishDialog.fromJson(
    Map<String, dynamic> json,
  ) {
    return EnglishDialog(
      name: json['name'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'content': content,
      };

  @override
  List<Object?> get props => [name, content];
}
