import 'package:flutter/material.dart';

enum WordStateEnum {
  neutral,
  done,
  mistake;

  Color getAppropriateColor() {
    switch (this) {
      case WordStateEnum.neutral:
        return Colors.grey;
      case WordStateEnum.done:
        return Colors.green;
      case WordStateEnum.mistake:
        return Colors.red;
    }
  }
}
