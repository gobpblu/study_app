import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:study_app/features/texts/models/text.dart';

class Texts extends Equatable {
  const Texts({required this.texts});

  final List<EnglishText> texts;

  factory Texts.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    print('Data: $data');
    return Texts(texts: data?['texts']);
  }

  Map<String, dynamic> toFirestore() => {
        'texts': texts.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [texts];
}
