// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `WORDS`
  String get bottom_nav_words {
    return Intl.message(
      'WORDS',
      name: 'bottom_nav_words',
      desc: '',
      args: [],
    );
  }

  /// `RULES`
  String get bottom_nav_rules {
    return Intl.message(
      'RULES',
      name: 'bottom_nav_rules',
      desc: '',
      args: [],
    );
  }

  /// `EXERCISES`
  String get bottom_nav_exercises {
    return Intl.message(
      'EXERCISES',
      name: 'bottom_nav_exercises',
      desc: '',
      args: [],
    );
  }

  /// `Урок 1`
  String get word_tile_1 {
    return Intl.message(
      'Урок 1',
      name: 'word_tile_1',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get sign_in {
    return Intl.message(
      'Войти',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get register {
    return Intl.message(
      'Зарегистрироваться',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get sign_in_with_gogle {
    return Intl.message(
      'Google',
      name: 'sign_in_with_gogle',
      desc: '',
      args: [],
    );
  }

  /// `Логин и пароль`
  String get sign_in_with_login_and_password {
    return Intl.message(
      'Логин и пароль',
      name: 'sign_in_with_login_and_password',
      desc: '',
      args: [],
    );
  }

  /// `Войдите в свой аккаунт, чтобы сохранить прогресс.`
  String get auth_log_in_to_save {
    return Intl.message(
      'Войдите в свой аккаунт, чтобы сохранить прогресс.',
      name: 'auth_log_in_to_save',
      desc: '',
      args: [],
    );
  }

  /// `Войдите в аккаунт`
  String get auth_log_in {
    return Intl.message(
      'Войдите в аккаунт',
      name: 'auth_log_in',
      desc: '',
      args: [],
    );
  }

  /// `Введите имя пользователя`
  String get auth_title {
    return Intl.message(
      'Введите имя пользователя',
      name: 'auth_title',
      desc: '',
      args: [],
    );
  }

  /// `Имя пользователя`
  String get auth_username {
    return Intl.message(
      'Имя пользователя',
      name: 'auth_username',
      desc: '',
      args: [],
    );
  }

  /// `Логин`
  String get login {
    return Intl.message(
      'Логин',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Почта`
  String get email {
    return Intl.message(
      'Почта',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Некорректный адрес почты`
  String get auth_error_invalid_email_title {
    return Intl.message(
      'Некорректный адрес почты',
      name: 'auth_error_invalid_email_title',
      desc: '',
      args: [],
    );
  }

  /// `Введите правильный адрес электронной почты`
  String get auth_error_invalid_email_description {
    return Intl.message(
      'Введите правильный адрес электронной почты',
      name: 'auth_error_invalid_email_description',
      desc: '',
      args: [],
    );
  }

  /// `Неправильный пароль`
  String get auth_error_invalid_password_title {
    return Intl.message(
      'Неправильный пароль',
      name: 'auth_error_invalid_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Введите ваш пароль`
  String get auth_error_invalid_password_description {
    return Intl.message(
      'Введите ваш пароль',
      name: 'auth_error_invalid_password_description',
      desc: '',
      args: [],
    );
  }

  /// `Пользователь не найден`
  String get auth_error_user_not_found_title {
    return Intl.message(
      'Пользователь не найден',
      name: 'auth_error_user_not_found_title',
      desc: '',
      args: [],
    );
  }

  /// `Попробуйте зарегистрировать данного пользователя`
  String get auth_error_user_not_found_description {
    return Intl.message(
      'Попробуйте зарегистрировать данного пользователя',
      name: 'auth_error_user_not_found_description',
      desc: '',
      args: [],
    );
  }

  /// `Уровни`
  String get levels_title {
    return Intl.message(
      'Уровни',
      name: 'levels_title',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile_title {
    return Intl.message(
      'Профиль',
      name: 'profile_title',
      desc: '',
      args: [],
    );
  }

  /// `Сменить имя пользователя`
  String get profile_button_change_username {
    return Intl.message(
      'Сменить имя пользователя',
      name: 'profile_button_change_username',
      desc: '',
      args: [],
    );
  }

  /// `Сменить язык обучения`
  String get profile_button_change_study_language {
    return Intl.message(
      'Сменить язык обучения',
      name: 'profile_button_change_study_language',
      desc: '',
      args: [],
    );
  }

  /// `Страны и национальности`
  String get words_beginner_countries_and_nationalities {
    return Intl.message(
      'Страны и национальности',
      name: 'words_beginner_countries_and_nationalities',
      desc: '',
      args: [],
    );
  }

  /// `Выбор языка`
  String get languages_title {
    return Intl.message(
      'Выбор языка',
      name: 'languages_title',
      desc: '',
      args: [],
    );
  }

  /// `Английский`
  String get language_type_english {
    return Intl.message(
      'Английский',
      name: 'language_type_english',
      desc: '',
      args: [],
    );
  }

  /// `Кыргызский`
  String get language_type_kyrgyz {
    return Intl.message(
      'Кыргызский',
      name: 'language_type_kyrgyz',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get language_button_save {
    return Intl.message(
      'Сохранить',
      name: 'language_button_save',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
