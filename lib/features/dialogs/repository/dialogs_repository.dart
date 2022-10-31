import '../models/english_dialog.dart';

abstract class DialogsRepository {
  Future<List<EnglishDialog>> loadDialogs();
  Future<List<EnglishDialog>> loadDialogsFromLocal(int count);
}