import 'package:get/get.dart';

class Strings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'bottom_nav_words': 'WORDS',
      'bottom_nav_rules': 'RULES',
      'bottom_nav_exercises': 'EXERCISES',

      'auth_title': "Enter username",
      'auth_username': "Username",
      'auth_log_in': 'Log in to your account',
      'auth_log_in_to_save': 'Log in to your account to save your progress',

      'button_change': 'CHANGE',

      'cards_title': 'Cards',

      'collect_word_title': 'Collect word',
    },
    'ru': {
      'bottom_nav_words': 'СЛОВА',
      'bottom_nav_rules': 'ПРАВИЛА',
      'bottom_nav_exercises': 'УПРАЖНЕНИЯ',

      'auth_title': "Введите имя пользователя",
      'auth_username': 'Имя пользователя',
      'auth_log_in': 'Войдите в аккаунт',
      'auth_log_in_to_save': 'Войдите в свой аккаунт, чтобы сохранить прогресс.',

      'button_change': 'ИЗМЕНИТЬ',

      'cards_title': 'Карточки',

      'collect_word_title': 'Собери слово',
    },
  };

}