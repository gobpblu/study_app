import '../models/text.dart';

abstract class TextsRepository {
  Future<List<EnglishText>> loadTexts();
  Future<List<EnglishText>> loadTextsFromLocal(int count);
}