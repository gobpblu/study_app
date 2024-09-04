// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "auth_error_invalid_email_description":
            MessageLookupByLibrary.simpleMessage("Enter correct email address"),
        "auth_error_invalid_email_title":
            MessageLookupByLibrary.simpleMessage("Invalid email"),
        "auth_error_invalid_password_description":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "auth_error_invalid_password_title":
            MessageLookupByLibrary.simpleMessage("Invalid password"),
        "auth_log_in":
            MessageLookupByLibrary.simpleMessage("Log in to your account"),
        "auth_log_in_to_save": MessageLookupByLibrary.simpleMessage(
            "Log in to your account to save your progress."),
        "auth_title": MessageLookupByLibrary.simpleMessage("Enter username"),
        "auth_username": MessageLookupByLibrary.simpleMessage("Username"),
        "bottom_nav_exercises":
            MessageLookupByLibrary.simpleMessage("EXERCISES"),
        "bottom_nav_rules": MessageLookupByLibrary.simpleMessage("RULES"),
        "bottom_nav_words": MessageLookupByLibrary.simpleMessage("WORDS"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Sign in"),
        "sign_in_with_gogle": MessageLookupByLibrary.simpleMessage("Google"),
        "sign_in_with_login_and_password":
            MessageLookupByLibrary.simpleMessage("Login and password"),
        "word_tile_1": MessageLookupByLibrary.simpleMessage("Lesson 1")
      };
}
