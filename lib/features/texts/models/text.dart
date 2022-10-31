import 'package:equatable/equatable.dart';

class EnglishText extends Equatable {
  const EnglishText({required this.name, required this.content});

  final String name;
  final String content;

  EnglishText.fromJson(
    Map<String, dynamic> json,
  )   : name = json['name'],
        content = json['content'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'content': content,
      };

  @override
  List<Object?> get props => [name, content];
}
