import 'package:flutter/material.dart';

enum WordState {
  neutral,
  done,
  mistake;

  Color getAppropriateColor() {
    switch (this) {
      case WordState.neutral:
        return Colors.grey;
      case WordState.done:
        return Colors.green;
      case WordState.mistake:
        return Colors.red;
    }
  }
}
