// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "auth_error_invalid_email_description":
            MessageLookupByLibrary.simpleMessage(
                "Введите правильный адрес электронной почты"),
        "auth_error_invalid_email_title":
            MessageLookupByLibrary.simpleMessage("Некорректный адрес почты"),
        "auth_error_invalid_password_description":
            MessageLookupByLibrary.simpleMessage("Введите ваш пароль"),
        "auth_error_invalid_password_title":
            MessageLookupByLibrary.simpleMessage("Неправильный пароль"),
        "auth_log_in":
            MessageLookupByLibrary.simpleMessage("Войдите в аккаунт"),
        "auth_log_in_to_save": MessageLookupByLibrary.simpleMessage(
            "Войдите в свой аккаунт, чтобы сохранить прогресс."),
        "auth_title":
            MessageLookupByLibrary.simpleMessage("Введите имя пользователя"),
        "auth_username":
            MessageLookupByLibrary.simpleMessage("Имя пользователя"),
        "bottom_nav_exercises":
            MessageLookupByLibrary.simpleMessage("EXERCISES"),
        "bottom_nav_rules": MessageLookupByLibrary.simpleMessage("RULES"),
        "bottom_nav_words": MessageLookupByLibrary.simpleMessage("WORDS"),
        "email": MessageLookupByLibrary.simpleMessage("Почта"),
        "levels_title": MessageLookupByLibrary.simpleMessage("Уровни"),
        "login": MessageLookupByLibrary.simpleMessage("Логин"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Войти"),
        "sign_in_with_gogle": MessageLookupByLibrary.simpleMessage("Google"),
        "sign_in_with_login_and_password":
            MessageLookupByLibrary.simpleMessage("Логин и пароль"),
        "word_tile_1": MessageLookupByLibrary.simpleMessage("Урок 1")
      };
}
